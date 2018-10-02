let history_link_selector = '.scrapbook';

$(function () {
  $(document).on('click', history_link_selector, function(e) {
    $.get(history_url($(this)), {}, function(response_data) {
      let $modal = $(history_modal_selector);

      setModalContent($modal, response_data);
      showModal($modal);
    });
    e.stopPropagation();
    return false;
  });
});

let history_modal_selector         = '#history_modal';
let history_modal_header_selector  = '#history_modal_header';
let history_modal_body_selector    = '#history_modal_body';

function history_url($ele) {
  let obj_id       = $ele.data('id');
  let object_class = $ele.data('klass');
  let object_key   = $ele.data('key');

  return '/life_story?id=' + obj_id +
    '&klass=' + object_class +
    '&key=' + object_key
}

function setModalContent($modal, data) {
  let header_content = data['name'];
  let body_content   = data['history'].replace(/\n/g, '<br />');

  $modal.find(history_modal_header_selector).html(header_content);
  $modal.find(history_modal_body_selector).html(body_content);
}

function showModal($modal) {
  $modal.dialog({
    dialogClass: 'no-close',
    modal: true,
    buttons: [
      {
        text: 'OK',
        click: function () {
          $(this).dialog('close');
        }
      }
    ],
    width: 700,
    open: function (event, ui) {
      $('.ui-widget-overlay').addClass('override');
    }
  });
}
