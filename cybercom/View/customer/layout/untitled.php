                    <div class="tab-pane fade in active" id="men">
                      <ul class="aa-product-catg">
                        <!-- start single product item -->

                        <!-- start single product item -->
                        <?php if($products):?>
                        <?php foreach ($products->getData() as $key => $product) :?>
                        <li>
                          <figure>
                            <a class="aa-product-img" href="#"><img src="<?php echo $this->baseUrl('Images/Product/').$product->image;?>"></a>
                            <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                              <figcaption>
                              <h4 class="aa-product-title"><a href="#"><?php echo $product->name?></a></h4>
                              <span class="aa-product-price">$<?= $product->price?></span><span class="aa-product-price"><del></del></span>
                            </figcaption>
                          </figure>                        
                          <div class="aa-product-hvr-content">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                            <a href="" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                          
                          </div>
                          <!-- product badge -->
                          <!--<span class="aa-badge aa-sale" href="#">SALE!</span>-->
                        </li>
                        <?php endforeach;?>
                      <?php endif;?>
                        <!-- start single product item -->
                                               
                      </ul>
                      <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                    </div>