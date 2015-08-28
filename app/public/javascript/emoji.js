  $(document).ready(function(e) {

      $('.emojiable-question').emojiPicker({
        width: '300px',
        height: '200px',
        button: false
      });

      $('.emojiable-option').emojiPicker({
        width: '200px',
        height: '100px'
      });

      $('#trigger').click(function(e) {
        e.preventDefault();
        $('#question').emojiPicker('toggle');
      });

    });