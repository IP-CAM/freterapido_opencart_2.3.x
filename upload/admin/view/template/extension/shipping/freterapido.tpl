<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-freterapido" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <div>
          <div style="padding:15px;text-align: center; vertical-align:bottom;">
            <a href="http://www.freterapido.com" target="_blank">
              <img src="https://freterapido.com/imgs/frete_rapido.png" style="margin: auto" />
            </a>
            <div style="padding-top: 20px;">
              Configure abaixo a sua conta com os dados da loja para obter as cotações de frete através do Frete Rápido.
              </br>
              O token e as configurações dos Correios estão disponíveis no seu <a href="https://freterapido.com/painel/" target="_blank"<name />Painel administrativo</a>.
              </br>
              Em caso de dúvidas, reporte de bugs ou sugestão de melhorias, acesse a <a href="https://github.com/freterapido/freterapido_opencart_2.3.x" target="_blank"<name />documentação deste módulo no Github</a>.
              </br>
            </div>
          </div>
        </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-freterapido" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="freterapido_status" id="input-status" class="form-control">
                <?php if ($freterapido_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-cnpj"><span data-toggle="tooltip" title="<?php echo $help_cnpj; ?>"><?php echo $entry_cnpj; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="freterapido_cnpj" value="<?php echo $freterapido_cnpj; ?>" placeholder="<?php echo $entry_cnpj; ?>" id="input-cnpj" class="form-control" />
              <?php if ($error_cnpj) { ?>
              <div class="text-danger"><?php echo $error_cnpj; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-results"><?php echo $entry_results; ?></label>
            <div class="col-sm-10">
              <select name="freterapido_results" id="input-results" class="form-control">
                <option value="0" <?php echo $freterapido_results == 0 ? 'selected="selected"' : '' ?>>
                <?php echo $text_results_nofilter; ?>
                </option>
                <option value="1" <?php echo $freterapido_results == 1 ? 'selected="selected"' : '' ?>>
                <?php echo $text_results_cheaper; ?>
                </option>
                <option value="2" <?php echo $freterapido_results == 2 ? 'selected="selected"' : '' ?>>
                <?php echo $text_results_faster; ?>
                </option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="number" class="form-control" min="0" max="20" step="1" value="<?php echo $freterapido_limit; ?>" placeholder="<?php echo $entry_limit; ?>" name="freterapido_limit" id="input-limit">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-length"><span data-toggle="tooltip" title="<?php echo $help_dimension; ?>"><?php echo $entry_dimension; ?></span></label>
            <div class="col-sm-10">
              <div class="row">
                <div class="col-sm-4">
                  <input type="text" name="freterapido_length" value="<?php echo $freterapido_length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                </div>
                <div class="col-sm-4">
                  <input type="text" name="freterapido_width" value="<?php echo $freterapido_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                </div>
                <div class="col-sm-4">
                  <input type="text" name="freterapido_height" value="<?php echo $freterapido_height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                </div>
              </div>
              <span><?php echo $help_dimension_unit ?></span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-token"><span data-toggle="tooltip" title="<?php echo $help_freterapido_token; ?>"><?php echo $entry_freterapido_token; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="freterapido_token" value="<?php echo $freterapido_token; ?>" placeholder="<?php echo $entry_freterapido_token_code; ?>" id="input-token" class="form-control" />
              <?php if ($error_token) { ?>
              <div class="text-danger"><?php echo $error_token; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="freterapido_sort_order" value="<?php echo $freterapido_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/maskedinput/jquery.maskedinput.min.js"></script>
<script>
    jQuery(function($){
        $("#input-cnpj").mask("99.999.999/9999-99");
    });
</script>
<?php echo $footer; ?>
