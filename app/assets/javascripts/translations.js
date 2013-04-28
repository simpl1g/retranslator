function loadTranslations(element) {
    var translation = $(element);
    $.ajax({
        url:translation.data("url"),
        data: {
            language: translation.prev().text()
        }
    }).done(function (data) {
            translation.replaceWith(data);
        });

}