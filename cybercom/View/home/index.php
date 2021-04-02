<?php
 
echo $this->getBlock('Block\Customer\Layout\Navbar')->toHtml();
echo $this->getBlock('Block\Customer\Layout\Slider')->toHtml();
echo $this->getBlock('Block\Customer\Layout\ProductSection')->toHtml();
echo $this->getBlock('Block\Customer\Layout\Banner')->toHtml();
echo $this->getBlock('Block\Customer\Layout\FeaturedCategory')->toHtml();
echo $this->getBlock('Block\Customer\Layout\Brand')->toHtml();

?>