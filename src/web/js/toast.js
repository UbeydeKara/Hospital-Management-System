function sweetAlert(message, variant) {
    $('body')
        .toast({
            class: variant,
            message: message,
            showIcon: variant == "success" ? "check circle outline" : "exclamation circle",
            showProgress: 'bottom',
            title: variant == "success" ? "İşlem Başarılı" : "Hata",
            displayTime: 5000,
//            className: { toast: 'ui message' }
        });
}