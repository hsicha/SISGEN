<!DOCTYPE html>
<html lang="es">
  <!-- Mirrored from demo.dashboardpack.com/user-management-html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 04 Jan 2023 23:19:07 GMT -->
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title><?=isset($this->title)?$this->title:"Sistema de Ventas";?></title>
    <link rel="icon" href="<?= URL?>public/img/mini_logo.png" type="image/png" />

    <link rel="stylesheet" href="<?=URL?>public/css/bootstrap1.min.css" />

    <link rel="stylesheet" href="<?=URL?>public/vendors/themefy_icon/themify-icons.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/niceselect/css/nice-select.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/owl_carousel/css/owl.carousel.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/gijgo/gijgo.min.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/font_awesome/css/all.min.css" />
    <link rel="stylesheet" href="<?= URL?>public/vendors/tagsinput/tagsinput.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/datepicker/date-picker.css" />
    <link rel="stylesheet" href="<?= URL?>public/vendors/vectormap-home/vectormap-2.0.2.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/scroll/scrollable.css" />

  

    <link rel="stylesheet" href="<?= URL?>public/vendors/datatable/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="<?= URL?>public/vendors/datatable/css/responsive.dataTables.min.css" />
    <link rel="stylesheet" href="<?= URL?>public/vendors/datatable/css/buttons.dataTables.min.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/text_editor/summernote-bs4.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/morris/morris.css" />

    <link rel="stylesheet" href="<?= URL?>public/vendors/material_icon/material-icons.css" />

    <link rel="stylesheet" href="<?= URL?>public/css/metisMenu.css" />

    <link rel="stylesheet" href="<?= URL?>public/css/style1.css" />
   
    <link rel="stylesheet" href="<?= URL?>public/css/colors/default.css" id="colorSkinCSS" />
    <link rel="stylesheet" href="<?= URL?>node_modules/sweetalert2/dist/sweetalert2.min">
    <link rel="stylesheet" href="<?= URL?>public/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="<?= URL?>https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  </head>
  <body class="crm_body_bg">
    <nav class="sidebar">
      <div class="logo d-flex justify-content-between">
        <a class="large_logo" href="<?=URL?>principal"
          ><img src="<?= URL?>public/img/logo.png" alt=""
        /></a>
        <a class="small_logo" href="<?=URL?>principal"
          ><img src="<?= URL?>public/img/mini_logo.png" alt=""
        /></a>
        <div class="sidebar_close_icon d-lg-none">
          <i class="ti-close"></i>
        </div>
      </div>
      <ul id="sidebar_menu">
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/dashboard.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Almacen </span>
            </div>
          </a>
          <ul>
            <li><a href="<?= URL?>marca">Marca</a></li>
            <li><a href="<?=URL?>categoria">Categoria</a></li>
            <li><a href="<?=URL?>presentacion">Presentación</a></li>
            <li><a href="<?=URL?>producto">Producto</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/2.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Compras </span>
            </div>
          </a>
          <ul>
            <li><a href="<?=URL?>proveedor">Proveedor</a></li>
            <li><a href="<?=URL?>compras">Compras</a></li>
            <li><a href="<?=URL?>compras/consultar_compras">Consultar Compras</a></li>
            <li><a href="faq.html">Compras por Fecha</a></li>
          </ul>
        </li>
        <li class="">
          <a href="navs.html" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?=URL?>public/img/menu-icon/12.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Tipo Documento</span>
            </div>
          </a>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?=URL?>public/img/menu-icon/3.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Ventas</span>
            </div>
          </a>
          <ul>
            <li><a href="login.html">Cliente</a></li>
            <li><a href="resister.html">Ventas</a></li>
            <li><a href="error_400.html">Consultar Ventas</a></li>
            <li><a href="error_500.html">Ventas por Fecha</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?=URL?>public/img/menu-icon/4.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Usuario</span>
            </div>
          </a>
          <ul>
            <li><a href="admin_list.html">Usuario</a></li>
            <li><a href="<?=URL?>add_new_admin.html">Perfiles</a></li>
            <li><a href="<?= URL?>add_new_admin.html">Permisos</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?=URL?>public/img/menu-icon/11.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Role & Permissions</span>
            </div>
          </a>
          <ul>
            <li><a href="module_setting.html">Module Setting</a></li>
            <li><a href="role_permissions.html">Role & Permissions</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/5.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Users</span>
            </div>
          </a>
          <ul>
            <li><a href="user_list.html">Users List</a></li>
            <li><a href="add_new_user.html">Add New User</a></li>
          </ul>
        </li>
        <li>
          <a href="Builder.html" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/6.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Builder </span>
            </div>
          </a>
        </li>
        <li class="">
          <a href="invoice.html" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/7.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Invoice</span>
            </div>
          </a>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/8.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>forms</span>
            </div>
          </a>
          <ul>
            <li><a href="Basic_Elements.html">Basic Elements</a></li>
            <li><a href="Groups.html">Groups</a></li>
            <li><a href="Max_Length.html">Max Length</a></li>
            <li><a href="Layouts.html">Layouts</a></li>
          </ul>
        </li>
        <li class="">
          <a href="Board.html" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/9.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Board</span>
            </div>
          </a>
        </li>
        <li class="">
          <a href="calender.html" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/10.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Calander</span>
            </div>
          </a>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/11.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Themes</span>
            </div>
          </a>
          <ul>
            <li><a href="dark_sidebar.html">Dark Sidebar</a></li>
            <li><a href="light_sidebar.html">light Sidebar</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/12.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>General</span>
            </div>
          </a>
          <ul>
            <li><a href="Minimized_Aside.html">Minimized Aside</a></li>
            <li><a href="empty_page.html">Empty page</a></li>
            <li><a href="fixed_footer.html">Fixed Footer</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/13.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Products</span>
            </div>
          </a>
          <ul>
            <li><a href="Products.html">Products</a></li>
            <li><a href="Product_Details.html">Product Details</a></li>
            <li><a href="Cart.html">Cart</a></li>
            <li><a href="Checkout.html">Checkout</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/14.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Icons</span>
            </div>
          </a>
          <ul>
            <li><a href="Fontawesome_Icon.html">Fontawesome Icon</a></li>
            <li><a href="themefy_icon.html">themefy icon</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/15.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Animations</span>
            </div>
          </a>
          <ul>
            <li><a href="wow_animation.html">Animate</a></li>
            <li><a href="Scroll_Reveal.html">Scroll Reveal</a></li>
            <li><a href="tilt.html">Tilt Animation</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/16.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Components</span>
            </div>
          </a>
          <ul>
            <li><a href="accordion.html">Accordions</a></li>
            <li><a href="Scrollable.html">Scrollable</a></li>
            <li><a href="notification.html">Notifications</a></li>
            <li><a href="carousel.html">Carousel</a></li>
            <li><a href="Pagination.html">Pagination</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/17.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Table</span>
            </div>
          </a>
          <ul>
            <li><a href="data_table.html">Data Tables</a></li>
            <li><a href="bootstrap_table.html">Bootstrap</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/18.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Cards</span>
            </div>
          </a>
          <ul>
            <li><a href="basic_card.html">Basic Card</a></li>
            <li><a href="theme_card.html">Theme Card</a></li>
            <li><a href="dargable_card.html">Draggable Card</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/19.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Charts</span>
            </div>
          </a>
          <ul>
            <li><a href="chartjs.html">ChartJS</a></li>
            <li><a href="apex_chart.html">Apex Charts</a></li>
            <li><a href="chart_sparkline.html">Chart sparkline</a></li>
            <li><a href="am_chart.html">am-charts</a></li>
            <li><a href="nvd3_charts.html">nvd3 charts.</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/20.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>UI Kits </span>
            </div>
          </a>
          <ul>
            <li><a href="colors.html">colors</a></li>
            <li><a href="Alerts.html">Alerts</a></li>
            <li><a href="buttons.html">Buttons</a></li>
            <li><a href="modal.html">modal</a></li>
            <li><a href="dropdown.html">Droopdowns</a></li>
            <li><a href="Badges.html">Badges</a></li>
            <li><a href="Loading_Indicators.html">Loading Indicators</a></li>
            <li><a href="color_plate.html">Color Plate</a></li>
            <li><a href="typography.html">Typography</a></li>
            <li><a href="datepicker.html">Date Picker</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/21.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Widgets</span>
            </div>
          </a>
          <ul>
            <li><a href="chart_box_1.html">Chart Boxes 1</a></li>
            <li><a href="profilebox.html">Profile Box</a></li>
          </ul>
        </li>
        <li class="">
          <a class="has-arrow" href="#" aria-expanded="false">
            <div class="nav_icon_small">
              <img src="<?= URL?>public/img/menu-icon/12.svg" alt="" />
            </div>
            <div class="nav_title">
              <span>Maps</span>
            </div>
          </a>
          <ul>
            <li><a href="mapjs.html">Maps JS</a></li>
            <li><a href="vector_map.html">Vector Maps</a></li>
          </ul>
        </li>
      </ul>
    </nav>

    <section class="main_content dashboard_part large_header_bg">
      <div class="container-fluid g-0">
        <div class="row">
          <div class="col-lg-12 p-0">
            <div
              class="header_iner d-flex justify-content-between align-items-center"
            >
              <div class="sidebar_icon d-lg-none">
                <i class="ti-menu"></i>
              </div>
              <div class="line_icon open_miniSide d-none d-lg-block">
                <img src="<?= URL?>public/img/line_img.png" alt="" />
              </div>
              <div class="serach_field-area d-flex align-items-center"></div>
              <div
                class="header_right d-flex justify-content-between align-items-center"
              >
                <div class="header_notification_warp d-flex align-items-center">
                  <li>
                    <a class="bell_notification_clicker" href="#">
                      <img src="<?= URL?>public/img/icon/bell.svg" alt="" />
                      <span>2</span>
                    </a>

                    <div class="Menu_NOtification_Wrap">
                      <div class="notification_Header">
                        <h4>Notifications</h4>
                      </div>
                      <div class="Notification_body">
                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/2.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>Cool Marketing</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>

                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/4.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>Awesome packages</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>

                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/3.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>what a packages</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>

                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/2.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>Cool Marketing</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>

                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/4.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>Awesome packages</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>

                        <div class="single_notify d-flex align-items-center">
                          <div class="notify_thumb">
                            <a href="#"><img src="<?= URL?>public/img/staf/3.png" alt="" /></a>
                          </div>
                          <div class="notify_content">
                            <a href="#"><h5>what a packages</h5></a>
                            <p>Lorem ipsum dolor sit amet</p>
                          </div>
                        </div>
                      </div>
                      <div class="nofity_footer">
                        <div class="submit_button text-center pt_20">
                          <a href="#" class="btn_1">See More</a>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <a class="CHATBOX_open" href="#">
                      <img src="<?= URL?>public/img/icon/msg.svg" alt="" /> <span>3</span>
                    </a>
                  </li>
                </div>
                <div class="profile_info">
                  <img src="<?=URL?>public/img/client_img.png" alt="#" />
                  <div class="profile_info_iner">
                    <div class="profile_author_name">
                      <p>Neurologist</p>
                      <h5>Dr. Robar Smith</h5>
                    </div>
                    <div class="profile_info_details">
                      <a href="#">My Profile </a>
                      <a href="#">Settings</a>
                      <a href="#">Log Out </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    