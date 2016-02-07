<?php
jimport('joomla.cache.storage');
class JCacheStorageLoffile extends JCacheStorageFile
{
	/**
	 * @since	1.6
	 */
	protected $_root;

	/**
	 * Constructor
	 *
	 * @param	array	$options optional parameters
	 * @since	1.5
	 */
	public function __construct($options = array())
	{
		parent::__construct($options);
		$this->_root	= $options['cachebase'];
	}
	/**
	 * Get a cache file path from an id/group pair
	 *
	 * @param	string	$id		The cache data id
	 * @param	string	$group	The cache data group
	 * @return	string	The cache file path
	 * @since	1.5
	 */
	public function _getFilePath($id, $group)
	{
		$name	= $this->_getCacheId($id, $group);
		$dir	= $this->_root.DS.$group;

		// If the folder doesn't exist try to create it
		if (!is_dir($dir)) {

			// Make sure the index file is there
			$indexFile = $dir.'/index.html';
			@ mkdir($dir) && file_put_contents($indexFile, '<html><body bgcolor="#FFFFFF"></body></html>');
		}

		// Make sure the folder exists
		if (!is_dir($dir)) {
			return false;
		}
		return $dir.DS.$name.'.php';
	}
	/**
	 * Check to make sure cache is still valid, if not, delete it.
	 *
	 * @param	string	$id		Cache key to expire.
	 * @param	string	$group	The cache data group.
	 * @since	1.6
	 */
	protected function _checkExpire($id, $group)
	{
		$path = $this->_getFilePath($id, $group);

		// check prune period
		if (file_exists($path)) {
			$time = @filemtime($path);
			if (($time + $this->_lifetime) < $this->_now || empty($time)) {
				@unlink($path);
				return false;
			}
			return true;
		}
		return false;
	}
	/**
	 * Quickly delete a folder of files
	 *
	 * @param string The path to the folder to delete.
	 * @return boolean True on success.
	 * @since 1.6
	 */
	protected function _deleteFolder($path)
	{
	// Sanity check
		if (!$path || !is_dir($path) || empty($this->_root)) {
			// Bad programmer! Bad Bad programmer!
			JError::raiseWarning(500, 'JCacheStorageFile::_deleteFolder ' . JText::_('JLIB_FILESYSTEM_ERROR_DELETE_BASE_DIRECTORY'));
			return false;
		}

		$path = $this->_cleanPath($path);

		// Check to make sure path is inside cache folder, we do not want to delete Joomla root!
		$pos = strpos($path, $this->_cleanPath($this->_root));

		if ($pos === false || $pos > 0) {
			JError::raiseWarning(500, 'JCacheStorageFile::_deleteFolder' . JText::sprintf('JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER', $path));
			return false;
		}


		// Remove all the files in folder if they exist; disable all filtering
		$files = $this->_filesInFolder($path, '.', false, true, array(), array());

		if (!empty($files) && !is_array($files)) {
			if (@unlink($files) !== true) {
				return false;
			}
		} else if (!empty($files) && is_array($files)) {

			foreach ($files as $file)
			{
				$file = $this->_cleanPath($file);

				// In case of restricted permissions we zap it one way or the other
				// as long as the owner is either the webserver or the ftp
				if (@unlink($file)) {
					// Do nothing
				} else {
					$filename = basename($file);
					JError::raiseWarning('SOME_ERROR_CODE', 'JCacheStorageFile::_deleteFolder' . JText::sprintf('JLIB_FILESYSTEM_DELETE_FAILED', $filename));
					return false;
				}
			}
		}


		// Remove sub-folders of folder; disable all filtering
		$folders = $this->_folders($path, '.', false, true, array(), array());

		foreach ($folders as $folder) {
			if (is_link($folder)) {
				// Don't descend into linked directories, just delete the link.
				if (@unlink($folder) !== true) {
					return false;
				}
			} elseif ($this->_deleteFolder($folder) !== true) {
				return false;
			}
		}


		// In case of restricted permissions we zap it one way or the other
		// as long as the owner is either the webserver or the ftp
		if (@rmdir($path)) {
			$ret = true;
		} else {
			JError::raiseWarning('SOME_ERROR_CODE', 'JCacheStorageFile::_deleteFolder' . JText::sprintf('JLIB_FILESYSTEM_ERROR_FOLDER_DELETE', $path));
			$ret = false;
		}
		return $ret;
	}


	/**
	 * Function to strip additional / or \ in a path name
	 *
	 * @param	string	The path to clean
	 * @param	string	Directory separator (optional)
	 * @return	string	The cleaned path
	 * @since	1.6
	 */
	protected function _cleanPath($path, $ds = DS)
	{
		$path = trim($path);

		if (empty($path)) {
			$path = $this->_root;
		} else {
			// Remove double slashes and backslahses and convert all slashes and backslashes to DS
			$path = preg_replace('#[/\\\\]+#', $ds, $path);
		}

		return $path;
	}


	/**
	 * Utility function to quickly read the files in a folder.
	 *
	 * @param	string	The path of the folder to read.
	 * @param	string	A filter for file names.
	 * @param	mixed	True to recursively search into sub-folders, or an
	 * integer to specify the maximum depth.
	 * @param	boolean	True to return the full path to the file.
	 * @param	array	Array with names of files which should not be shown in
	 * the result.
	 * @return	array	Files in the given folder.
	 * @since 1.6
	 */
	protected function _filesInFolder($path, $filter = '.', $recurse = false, $fullpath = false, $exclude = array('.svn', 'CVS','.DS_Store','__MACOSX'), $excludefilter = array('^\..*','.*~'))
	{
		// Initialise variables.
		$arr = array();

		// Check to make sure the path valid and clean
		$path = $this->_cleanPath($path);

		// Is the path a folder?
		if (!is_dir($path)) {
			JError::raiseWarning(21, 'JCacheStorageFile::_filesInFolder' . JText::sprintf('JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER', $path));
			return false;
		}

		// read the source directory
		$handle = opendir($path);
		if (count($excludefilter)) {
			$excludefilter = '/('. implode('|', $excludefilter) .')/';
		} else {
			$excludefilter = '';
		}
		while (($file = readdir($handle)) !== false)
		{
			if (($file != '.') && ($file != '..') && (!in_array($file, $exclude)) && (!$excludefilter || !preg_match($excludefilter, $file))) {
				$dir = $path . DS . $file;
				$isDir = is_dir($dir);
				if ($isDir) {
					if ($recurse) {
						if (is_integer($recurse)) {
							$arr2 = $this->_filesInFolder($dir, $filter, $recurse - 1, $fullpath);
						} else {
							$arr2 = $this->_filesInFolder($dir, $filter, $recurse, $fullpath);
						}

						$arr = array_merge($arr, $arr2);
					}
				} else {
					if (preg_match("/$filter/", $file)) {
						if ($fullpath) {
							$arr[] = $path . DS . $file;
						} else {
							$arr[] = $file;
						}
					}
				}
			}
		}
		closedir($handle);

		return $arr;
	}

/**
	 * Utility function to read the folders in a folder.
	 *
	 * @param	string	The path of the folder to read.
	 * @param	string	A filter for folder names.
	 * @param	mixed	True to recursively search into sub-folders, or an
	 * integer to specify the maximum depth.
	 * @param	boolean	True to return the full path to the folders.
	 * @param	array	Array with names of folders which should not be shown in
	 * the result.
	 * @param	array	Array with regular expressions matching folders which
	 * should not be shown in the result.
	 * @return	array	Folders in the given folder.
	 * @since 1.6
	 */
	protected function _folders($path, $filter = '.', $recurse = false, $fullpath = false, $exclude = array('.svn', 'CVS','.DS_Store','__MACOSX'), $excludefilter = array('^\..*'))
	{
		// Initialise variables.
		$arr = array();

		// Check to make sure the path valid and clean
		$path = $this->_cleanPath($path);

		// Is the path a folder?
		if (!is_dir($path)) {
			JError::raiseWarning(21, 'JCacheStorageFile::_folders' . JText::sprintf('JLIB_FILESYSTEM_ERROR_PATH_IS_NOT_A_FOLDER', $path));
			return false;
		}

		// read the source directory
		$handle = opendir($path);

		if (count($excludefilter)) {
			$excludefilter_string = '/('. implode('|', $excludefilter) .')/';
		} else {
			$excludefilter_string = '';
		}
		while (($file = readdir($handle)) !== false)
		{
			if (($file != '.') && ($file != '..') && (!in_array($file, $exclude)) && (empty($excludefilter_string) || !preg_match($excludefilter_string, $file))) {
				$dir = $path . DS . $file;
				$isDir = is_dir($dir);
				if ($isDir) {
					// Removes filtered directories
					if (preg_match("/$filter/", $file)) {
						if ($fullpath) {
							$arr[] = $dir;
						} else {
							$arr[] = $file;
						}
					}
					if ($recurse) {
						if (is_integer($recurse)) {
						$arr2 = $this->_folders($dir, $filter, $recurse - 1, $fullpath, $exclude, $excludefilter);
						} else {
						$arr2 = $this->_folders($dir, $filter, $recurse, $fullpath, $exclude, $excludefilter);
						}

						$arr = array_merge($arr, $arr2);
					}
				}
			}
		}
		closedir($handle);

		return $arr;
	}

}