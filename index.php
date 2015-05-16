<?php
# Directory Index (dirindex.php)
#
# Reads the current directory's content and displays it as
# HTML.  Useful if file listing is denied by the web server
# configuration.
#
# Installation:
# - Put in any directory you like on your PHP-capable webspace.
# - Rename to 'index.php' if you like it to get called if no
#   file is specified in the URL (e.g. www.example.com/files/).
# - Fit the design to your needs just using HTML and CSS.
#
# Changes since original release (25-Mar-2002):
# - simplified and modernized markup and styles (HTML5, CSS3,
#   list instead of table)
# - more functional programming approach
# - improved configurability
# - escaping of HTML characters
# - license changed from GPL to MIT
# - requires PHP 5.3.0 or later
#
# Version: 25-May-2011
# Copyright (c) 2002, 2011 Jochen Kupperschmidt <http://homework.nwsnet.de/>
# Released under the terms of the MIT license
# <http://www.opensource.org/licenses/mit-license.php>


### configuration

# Show the local path. Disable this for security reasons.
define('SHOW_PATH', TRUE);

# Show a link to the parent directory ('..').
define('SHOW_PARENT_LINK', TRUE);

# Show "hidden" directories and files, i.e. those whose names
# start with a dot.
define('SHOW_HIDDEN_ENTRIES', TRUE);

### /configuration


function get_grouped_entries($path) {
    list($dirs, $files) = collect_directories_and_files($path);
    $dirs = filter_directories($dirs);
    $files = filter_files($files);
    return array_merge(
        array_fill_keys($dirs, TRUE),
        array_fill_keys($files, FALSE));
}

function collect_directories_and_files($path) {
    # Retrieve directories and files inside the given path.
    # Also, `scandir()` already sorts the directory entries.
    $entries = scandir($path);
    return array_partition($entries, function($entry) {
        return is_dir($entry);
    });
}

function array_partition($array, $predicate_callback) {
    # Partition elements of an array into two arrays according
    # to the boolean result from evaluating the predicate.
    $results = array_fill_keys(array(1, 0), array());
    foreach ($array as $element) {
        array_push(
            $results[(int) $predicate_callback($element)],
            $element);
    }
    return array($results[1], $results[0]);
}

function filter_directories($dirs) {
    # Exclude directories. Adjust as necessary.
    return array_filter($dirs, function($dir) {
        return $dir != '.'  # current directory
            && (SHOW_PARENT_LINK || $dir != '..') # parent directory
            && !is_hidden($dir);
    });
}

function filter_files($files) {
    # Exclude files. Adjust as necessary.
    return array_filter($files, function($file) {
        return !is_hidden($file)
            && substr($file, -4) != '.php';  # PHP scripts
    });
}

function is_hidden($entry) {
    return !SHOW_HIDDEN_ENTRIES
        && substr($entry, 0, 1) == '.'  # Name starts with a dot.
        && $entry != '.'  # Ignore current directory.
        && $entry != '..';  # Ignore parent directory.
}

$drawing = __DIR__ . '/sketches/drawing';
$drawing_entries = get_grouped_entries($drawing);

$color = __DIR__ . '/sketches/color';
$color_entries = get_grouped_entries($color);

$conditional = __DIR__ . '/sketches/conditional';
$conditional_entries = get_grouped_entries($conditional);

$forLoop = __DIR__ . '/sketches/forLoop';
$forLoop_entries = get_grouped_entries($forLoop);

$math = __DIR__ . '/sketches/math';
$math_entries = get_grouped_entries($math);

$timepiece = __DIR__ . '/sketches/timepiece';
$timepiece_entries = get_grouped_entries($timepiece);

$variables = __DIR__ . '/sketches/variables';
$variables_entries = get_grouped_entries($variables);

$timepiece = __DIR__ . '/sketches/timepiece';
$timepiece_entries = get_grouped_entries($timepiece);
?>







<!DOCTYPE html>

<head>

	<meta charset="utf-8">
    <title>eebood</title>

	<link rel="stylesheet" href="codemirror-4.1/lib/codemirror.css">
    <link rel="stylesheet" href="codemirror-4.1/theme/solarized.css">
    <link rel="stylesheet" href="codemirror-4.1/theme/monokai.css">
    <link rel="stylesheet" type="text/css" href="style/style.css">


    <script src="codemirror-4.1/lib/codemirror.js"></script>
    <script src="codemirror-4.1/lib/matchbrackets.js"></script>
    <script src="codemirror-4.1/lib/clike.js"></script>


    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/processing.min.js"></script>
    <script type="text/javascript" src="scripts/script.js"></script>

</head>
<body>
	<div id="output"></div>
	<header>
		<div class="dynamicLogo">
			<canvas data-processing-sources="scripts/eeboodLogo.pde" id="logo"></canvas>
		</div>
		<!-- <h1 class="logo"></h1> -->
		<a class="button" id="sideBar_button"></a>
		<a class="button" id="play_button"></a>
		<a class="button disabledButton" id="stop_button"></a>
		<a class="button disabledButton" id="save_button" onclick="saveImage('window')"></a>

		<a class="button disabledButton" id="help_button"></a>
		<a class="button" id="new_button" href="" target="_blank"></a>
		<a class="button" id="ref_button" href="http://processingjs.org/reference/" target="_blank"></a>
		<div id="tooltip"></div>
	</header>
	<section id="wrapper">
		<nav class="sideBar css-treeview">

			<ul id="tree">
	            <li ><a class="file currentFile" href="readme/readme.txt">README</a></li>

	            <li>
	              <input type="checkbox" id="item-0" /><label for="item-0">drawing</label>
	              <ul>
        					<?php
        						foreach ($drawing_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/drawing/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-1" /><label for="item-1">color</label>
	              <ul>
        					<?php
        						foreach ($color_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/color/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-2" /><label for="item-2">conditional</label>
	              <ul>
        					<?php
        						foreach ($conditional_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/conditional/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-3" /><label for="item-3">for loop</label>
	              <ul>
        					<?php
        						foreach ($forLoop_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/forLoop/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-4" /><label for="item-4">math</label>
	              <ul>
        					<?php
        						foreach ($math_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/math/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-5" /><label for="item-5">variables</label>
	              <ul>
        					<?php
        						foreach ($variables_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/variables/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	            <li>
	              <input type="checkbox" id="item-6" /><label for="item-6">timepiece</label>
	              <ul>
        					<?php
        						foreach ($timepiece_entries as $entry => $is_dir) {
        						    $escaped_entry = htmlspecialchars($entry);
        						    if($escaped_entry != ".DS_Store" && $escaped_entry != ".."){
        						    	printf('<li ><a class="file" href="sketches/timepiece/%s">%s</a></li>' . "\n",$escaped_entry,$escaped_entry);
        						    }
        						}
        					?>
	              </ul>
	            </li>

	        </ul>
		</nav>
		<section id="code">

			<form><textarea id="txt" name="txt">
/* -- OOPS... something went wrong. try realoding the page. -- */
</textarea></form>
		</section>
	</section>

	<div id="overlay"></div>
	<div id="canvasWrapper">
		<canvas id="p5Window"></canvas>
	</div>


</body>
