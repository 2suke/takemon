// imageモデル入力フォームを追加する処理
window.addImageForm = function(){
    let changed = false;
    $('.images_form').each( function(){
        if($(this).css('display')=='none'){
            if(!changed){
                $(this).show();
                changed = true;
            }
        }
    });
    if(!changed) {
        $('#slide-alert').show();
    }
}

// imageモデル入力フォームを閉じる（入力値を削除してから非表示にする）処理
window.closeImageForm = function(index){
    let current_form = $('#slide-' + index);
    current_form.find('input').each(function(){
        $(this).val('');
    });
    current_form.hide();
    $('#slide-alert').hide();
    current_form.insertBefore('#append-btn');
}
