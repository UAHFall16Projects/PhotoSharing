$(function () {
    $("#uploadUserPhoto").on('change', function () {
        var input = this;
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var imageSize = e.total / 1024 / 1024;
                if (imageSize > 4) {
                    $('#uploadedImgContainer').hide();
                    $('#uploadPhoto-btn').attr('disabled', true);
                    $('#imageSizeCrossed').show();
                }
                else {
                    $('#uploadPhoto-btn').removeAttr('disabled');
                    $('#imageSizeCrossed').hide();
                    $('#uploadedImgContainer').show();
                    $('#uploadedImg')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    })
    $("#uploadprofilePic").on('change', function () {
        var input = this;
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                var imageSize = e.total / 1024 / 1024;
                if (imageSize > 4) {
                    $('#profileImageSizeCrossed').show();
                    $('#approve-btn').attr('disabled', true);
                }
                else {
                    $('#approve-btn').removeAttr('disabled');
                    $('#profileImageSizeCrossed').hide();
                    $('#uploadedProfileImg')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                }
            };
            reader.readAsDataURL(input.files[0]);
        }
    })

});