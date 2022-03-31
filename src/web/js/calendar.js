$(document).ready(function () {
$('.ui.dropdown').dropdown();
$('#type_calendar')
        .calendar({
            text: {
                days: ['Pts', 'Sal', 'Çar', 'Per', 'Cum', 'Cts', 'Paz'],
                months: ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'],
                monthsShort: ['Oca', 'Şub', 'Mar', 'Nis', 'May', 'Haz', 'Tem', 'Ağu', 'Eyl', 'Eki', 'Kas', 'Ara'],
                today: 'Bugün',
                now: 'Şimdi',
                am: 'AM',
                pm: 'PM'
            },
            formatter: {
                date: function (date, settings) {
                    if (!date)
                        return '';
                    var day = date.getDate();
                    var month = date.getMonth() + 1;
                    var year = date.getFullYear();
                    return year + '-' + ("0" + month).slice(-2) + '-' + ("0" + day).slice(-2);
                }
            }
        });
});