function loadTranslations(element) {
    var translation = $(element);
    $.ajax({
        url:translation.data("url")
    }).done(function (data) {
            translation.replaceWith(data);
        });

}