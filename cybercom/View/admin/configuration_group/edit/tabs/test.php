<?php

$number = 4567;
$factor = 6;

while($remainder != 0){
	$number = $number % 6;
	$remainder = $number/6;
	echo $remainder;
}

?>