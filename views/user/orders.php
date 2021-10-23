<?php include (ROOT."/views/layouts/header.php"); ?>
 <main>
      <div class="container">
             <div class="row">
                 <section id="cart_items">
                     <div class="container">
                         <div class="table-responsive cart_info">
                             <table class="table table-condensed">
                                 <thead>
                                    <tr class="cart_menu">
                                       <td class="orders-history-heading">
                                          <?php echo $this->langpack["account"]["orders_page"]["order_no"]?>
                                       </td>
                                       <td class="orders-history-heading">
                                          <?php echo $this->langpack["account"]["orders_page"]["products"]?>
                                       </td>
                                       <td class="orders-history-heading">
                                          <?php echo $this->langpack["account"]["orders_page"]["pay_status"]?>
                                       </td>
                                       <td class="orders-history-heading">
                                          <?php echo $this->langpack["account"]["orders_page"]["order_date"]?>
                                       </td>
                                       <td class="orders-history-heading">
                                          <?php echo $this->langpack['account']['orders_page']["complete_date"]?>  
                                       </td>
                                       <td class="orders-history-heading">სტატუსი</td>
                                     </tr>
                                 </thead>
                                 <tbody class="orders-row">
                                 <tr>
                                    <td>
                                      1245214214
                                    </td>
                                    <td id="orders-prods-td">
                                      <ul>
                                         <li>Product 1...<strong>(2)</strong></li>
                                         <li>Product 2...<strong>(2)</strong></li>
                                         <li>Product 3...<strong>(2)</strong></li>
                                         <br>
                                         <strong>
                                          <?php echo $this->langpack['account']['orders_page']["total"]?>:&nbsp;
                                          </strong>
                                          <span>45565₾</span>
                                      </ul>
                                    </td>
                                    <td>
                                       <span class="stat-true">
                                          გადახდილია
                                       </span>
                                    </td>
                                    <td>
                                       <i class="fa fa-calendar"></i>
                                       <span>23/10/2021</span>
                                       <i class="fa fa-clock-o" aria-hidden="true"></i>
                                       <span>10:30</span>
                                    </td>
                                    <td>
                                       <i class="fa fa-calendar"></i>
                                       <span>23/10/2021</span>
                                       <i class="fa fa-clock-o" aria-hidden="true"></i>
                                       <span>10:30</span>
                                    </td>
                                    <td>
                                       <span class="stat-true">
                                          <?php echo $this->langpack['account']['orders_page']["stat_complete"];?>
                                       </span>
                                    </td>
                                 </tbody>
                             </table>
                         </div>
                     </div>
                 </section> <!--/#cart_items-->
             </div>
      </div>
</main>
<?php include (ROOT."/views/layouts/footer.php"); ?>