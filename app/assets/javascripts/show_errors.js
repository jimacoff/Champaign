window.Champaign = window.Champaign || {};
window.Champaign.showErrors = function(e, data) {

  if (!e || !data || !e.target || !data.responseText || $(e.target).length == 0) {
    return; // no reason to try if we dont have what we need
  }
  if (data.status != 422) {
    return; // we're only interested in validation errors
  }

  $form = $(e.target);
  response = $.parseJSON(data.responseText);

  var errorMsg = function(field_name, msgs) {
    var name = field_name.replace(/_/g, ' ')
    return `<div class="error-msg">${name} ${msgs[0]}</div>`
  }

  var clearErrors = function() {
    $form.find('has-error').removeClass('has-error');
    $form.find('.error-msg').remove();
  }

  var hideError = function(e) {
    $(this).removeClass('has-error').parent().removeClass('has-error');
    $(this).siblings('.error-msg').remove();
  }

  var findField = function(field_name) {
    if (response.name) {
      field_name = `${response.name}[${field_name}]`
    }
    return $form.find(`[name="${field_name}"]`);
  }

  var showError = function(field_name, msgs) {
    field = findField(field_name)
    field.addClass('has-error').parent().addClass('has-error');
    field.parent().append(errorMsg(field_name, msgs));
    field.on('focus', hideError)
  }

  clearErrors();
  $.each(response.errors, showError);
}

