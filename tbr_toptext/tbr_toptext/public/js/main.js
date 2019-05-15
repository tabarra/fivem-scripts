$(function () {
    //Banner code
    var bannerIndex = 0;
    setInterval(() => {
        $("#tbr-banner").fadeOut(config.banner.fadeTime, function () {
            $(this).html(config.banner.messages[bannerIndex]);
            $(this).fadeIn(config.banner.fadeTime);
        });
        bannerIndex += 1;
        if (bannerIndex >= config.banner.messages.length) bannerIndex = 0;
    }, config.banner.interval * 1000);
});
