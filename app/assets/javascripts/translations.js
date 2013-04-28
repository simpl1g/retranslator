function loadTranslations(element) {
    var translation = $(element);
    console.log(translation.prev().data('id'))
    $.ajax({
        url:translation.data("url"),
        data: {
            language: translation.prev().find('span').data('id')
        }
    }).done(function (data) {
            translation.replaceWith(data);
        });

}