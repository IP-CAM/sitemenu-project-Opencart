<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-mainmenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-mainmenu" class="form-horizontal">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-slug"><?php echo $entry_slug; ?></label>
                <div class="col-sm-8">
                  <input type="text" name="slug" value="<?php echo $slug; ?>" placeholder="<?php echo $entry_slug; ?>" id="input-slug" class="form-control" />
                  <?php if ($error_slug) { ?>
                  <div class="text-danger"><?php echo $error_slug; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="col-sm-4 control-label"><?php echo $entry_position; ?></label>
                <div class="col-sm-8">
                  <div class="checkbox">
                    <div>
                      <label class="col-sm-8"><?php echo $entry_header; ?></label>
                      <label>
                        <?php if ($position_header) { ?>
                        <input type="checkbox" name="position_header" id="input-position-header" value="1" checked="checked">
                        <?php } else { ?>
                        <input type="checkbox" name="position_header" id="input-position-header" value="1">
                        <?php } ?>
                      </label>
                    </div>
                    <div>
                      <label class="col-sm-8"><?php echo $entry_footer; ?></label>
                      <label>
                        <?php if ($position_footer) { ?>
                        <input type="checkbox" name="position_footer" id="input-position-footer" value="1" checked="checked">
                        <?php } else { ?>
                        <input type="checkbox" name="position_footer" id="input-position-footer" value="1">
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                  <?php if ($error_position) { ?>
                  <div class="text-danger"><?php echo $error_position; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
              <button type="button" id="add-links" class="btn btn-primary btn-lg btn-block"><?php echo $entry_add; ?></button>
            </div>
            <div class="col-sm-4"></div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <table class="table table-striped table-bordered table-hover">
                <thead>
                  <tr>
                    <td></td>
                    <td class="text-left"><?php echo $entry_title; ?></td>
                    <td class="text-left"><?php echo $entry_href; ?></td>
                    <td class="text-left">Подменю</td>
                    <td></td>
                  </tr>
                  <?php if ($error_title) { ?>
                  <tr>
                  <div class="text-danger"><?php echo $error_title; ?></div>
                  </tr>
                  <?php } ?>
                  <?php if ($error_empty) { ?>
                  <tr>
                  <div class="text-danger"><?php echo $error_empty; ?></div>
                  </tr>
                  <?php } ?>
                </thead>
                <tbody id="links-group">
                <?php $counter = 0; ?>
                <?php if ($links) { ?>
                <?php foreach($links as $link) { ?>
                <tr id="links<?php echo $counter; ?>">
                  <td class="text-center" style="width: 5%; font-size: 20px;"><i class="fa fa-hand-paper-o"></i></td>
                  <td class="text-left" style="width: 20%;">
                    <input type="text" name="links[<?php echo $counter; ?>][title]" value="<?php echo $links[$counter]['title']; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control">
                  </td>
                  <td class="text-left" style="width: 20%;">
                    <input type="text" name="links[<?php echo $counter; ?>][href]" value="<?php echo $links[$counter]['href']; ?>" placeholder="<?php echo $entry_href; ?>" class="form-control">
                  </td>
                  <td id="sub-menu<?php echo $counter; ?>" class="sub-menu" style="width: 45%">
                    <?php if ($link['submenu']) { ?>
                    <?php $sub_counter = 0; ?>
                    <?php foreach($link['submenu'] as $sublink) { ?>
                    <div id="sub-link<?php echo $counter; ?>-<?php echo $sub_counter; ?>" class="form-group">
                      <div class="col-sm-2 text-center" style="font-size: 20px;">
                        <i class="fa fa-hand-paper-o"></i>
                      </div>
                      <div class="col-sm-4">
                        <input type="text" name="links[<?php echo $counter; ?>][sub-link][<?php echo $sub_counter; ?>][title]" value="<?php echo $sublink['title']; ?>" placeholder="Пункт меню" class="form-control">
                      </div>
                      <div class="col-sm-4">
                        <input type="text" name="links[<?php echo $counter; ?>][sub-link][<?php echo $sub_counter; ?>][href]" value="<?php echo $sublink['href']; ?>" placeholder="Ссылка" class="form-control">
                      </div>
                      <div class="col-sm-2">
                        <button type="button" data-toggle="tooltip" class="btn btn-danger" onclick="removeSubLink(<?php echo $counter; ?>, <?php echo $sub_counter; ?>);" data-original-title="">
                        <i class="fa fa-minus-circle"></i></button>
                      </div>
                    </div>
                    <?php $sub_counter++; ?>
                    <?php } ?>
                    <?php } ?>
                  </td>
                  <td class="text-center" style="width: 10%;">
                    <button type="button" data-toggle="tooltip" class="btn btn-primary" onclick="addSubMenu(<?php echo $counter; ?>);" data-original-title="<?php echo $entry_sub; ?>"><i class="fa fa-plus-circle"></i></button>
                    <button type="button" data-toggle="tooltip" class="btn btn-danger" onclick="removeLink(<?php echo $counter; ?>);" data-original-title="<?php echo $entry_remove; ?>"><i class="fa fa-minus-circle"></i></button>
                  </td>
                </tr>
                <?php $counter++; ?>
                <?php } ?>
                <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  var add = document.getElementById('add-links');
  var linksGroup = document.getElementById('links-group');
  var counter = <?php echo $counter; ?>;

  var titlePlaceholder = '<?php echo $entry_title; ?>';
  var hrefPlaceholder = '<?php echo $entry_href; ?>';
  var subPlaceholder = '<?php echo $entry_sub; ?>';
  var removePlaceholder = '<?php echo $entry_remove; ?>';

  function setAllAttribute(el, obj) {
    for (var attr in obj) {
      if (obj.hasOwnProperty(attr)) {
        el.setAttribute(attr, obj[attr]);
      }
    }
  }

  function addAllElementsToTheParent(el, arr) {
    arr.forEach(function (item) {
      el.appendChild(item);
    });
  }

  function removeLink(id) {
    linksGroup.removeChild(document.getElementById('links' + id));
    counter--;
  }

  function removeSubLink(id, link) {
    var subMenu = document.getElementById('sub-menu' + id);
    subMenu.removeChild(document.getElementById('sub-link' + id + '-' + link));
  }

  function createLinkBlock(id) {
    var tr = document.createElement('TR');
    var td1 = document.createElement('TD');
    var td2 = document.createElement('TD');
    var td3 = document.createElement('TD');
    var td4 = document.createElement('TD');
    var td5 = document.createElement('TD');

    var title = document.createElement('INPUT');
    var href = document.createElement('INPUT');
    var sub = document.createElement('BUTTON');
    var remove = document.createElement('BUTTON');
    var iconHand = document.createElement('I');
    var iconPlus = document.createElement('I');
    var iconMinus = document.createElement('I');

    setAllAttribute(tr, { id: 'links' + id });
    setAllAttribute(td1, { class: 'text-center', style: 'width: 5%; font-size: 20px;' });
    setAllAttribute(td2, { class: 'text-left', style: 'width: 20%' });
    setAllAttribute(td3, { class: 'text-left', style: 'width: 20%' });
    setAllAttribute(td4, { id: 'sub-menu' + id , class: 'text-left', style: 'width: 45%' });
    setAllAttribute(td5, { class: 'text-center', style: 'width: 10%' });
    setAllAttribute(title, { type: 'text', name: 'links[' + counter + '][title]', placeholder: titlePlaceholder, class: 'form-control' });
    setAllAttribute(href, { type: 'text', name: 'links[' + counter + '][href]', placeholder: hrefPlaceholder, class: 'form-control' });
    setAllAttribute(sub, { type: 'button', 'data-toggle': 'tooltip', class: 'btn btn-primary', onclick: 'addSubMenu(' + counter + ');', 'data-original-title': subPlaceholder, style: 'margin-right: 4px;' });
    setAllAttribute(remove, { type: 'button', 'data-toggle': 'tooltip', class: 'btn btn-danger', onclick: 'removeLink(' + counter + ');', 'data-original-title': removePlaceholder });
    setAllAttribute(iconHand, { class: 'fa fa-hand-paper-o' });
    setAllAttribute(iconPlus, { class: 'fa fa-plus-circle' });
    setAllAttribute(iconMinus, { class: 'fa fa-minus-circle' });

    sub.appendChild(iconPlus);
    remove.appendChild(iconMinus);
    td1.appendChild(iconHand);
    td2.appendChild(title);
    td3.appendChild(href);
    td5.appendChild(sub);
    td5.appendChild(remove);

    addAllElementsToTheParent(tr, [td1, td2, td3, td4, td5]);

    linksGroup.appendChild(tr);

    $('button').tooltip();

    counter++;
  }

  function addSubMenu(id) {
    var subMenu = document.getElementById('sub-menu' + id);
    var subCounter = [].slice.call(document.getElementById('sub-menu' + id).children).length;

    var subLink = document.createElement('DIV');
    var dragCol = document.createElement('DIV');
    var titleCol = document.createElement('DIV');
    var title = document.createElement('INPUT');
    var hrefCol = document.createElement('DIV');
    var href = document.createElement('INPUT');
    var removeCol = document.createElement('DIV');
    var remove = document.createElement('BUTTON');
    var iconHand = document.createElement('I');
    var iconMinus = document.createElement('I');

    setAllAttribute(subLink, { id: 'sub-link' + id + '-' + subCounter, class: 'form-group' });
    setAllAttribute(dragCol, { class: 'col-sm-2 text-center', style: 'font-size: 20px;' });
    setAllAttribute(titleCol, { class: 'col-sm-4' });
    setAllAttribute(title, { type: 'text', name: 'links[' + id + '][sub-link][' + subCounter + '][title]', placeholder: titlePlaceholder, class: 'form-control' });
    setAllAttribute(hrefCol, { class: 'col-sm-4' });
    setAllAttribute(href, { type: 'text', name: 'links[' + id + '][sub-link][' + subCounter + '][href]', placeholder: hrefPlaceholder, class: 'form-control' });
    setAllAttribute(removeCol, { class: 'col-sm-2' });
    setAllAttribute(remove, { type: 'button', 'data-toggle': 'tooltip', class: 'btn btn-danger', onclick: 'removeSubLink(' + id + ', ' + subCounter + ');', 'data-original-title':'' });
    setAllAttribute(iconHand, { class: 'fa fa-hand-paper-o' });
    setAllAttribute(iconMinus, { class: 'fa fa-minus-circle' });

    dragCol.appendChild(iconHand);
    remove.appendChild(iconMinus);
    removeCol.appendChild(remove);
    titleCol.appendChild(title);
    hrefCol.appendChild(href);

    addAllElementsToTheParent(subLink, [dragCol, titleCol, hrefCol, removeCol]);
    subMenu.appendChild(subLink);
    // subCounter++;
  }

  add.addEventListener('click', function (e) {
    e.preventDefault();
    e.stopPropagation();
    createLinkBlock(counter);
  });
--></script>
<script type="text/javascript"><!--
  $('#links-group').sortable();
  $('.sub-menu').sortable();
--></script>
<style>
  #links-group tr td:first-child {
    cursor: move;
  }
</style>
<?php echo $footer; ?>