//= require bootstrap_sb_admin_base_v2
//= require notifyjs
//= require bootbox

/* Sobrescreve data-confirm do Rails */

$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
        confirm: {
            label: 'Sim',
            label: '<i class="fa fa-check"></i> Confirmar'
        },
        cancel: {
            label: 'Não',
            label: '<i class="fa fa-times"></i> Cancelar'
        }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}
