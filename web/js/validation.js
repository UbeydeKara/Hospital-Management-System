$(document).ready(function () {
    $('.ui.form')
            .form({
                inline: true,
                fields: {
                    email: {
                        identifier: 'email',
                        rules: [
                            {
                                type: 'regExp',
                                value: '/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/',
                                prompt: 'Lütfen bir geçerli e-posta girin'
                            }
                        ]
                    },
                    password: {
                        identifier: 'password',
                        rules: [
                            {
                                type: 'empty',
                                prompt: 'Lütfen parola girin'
                            }
                        ]
                    }
                }})
            ;
});