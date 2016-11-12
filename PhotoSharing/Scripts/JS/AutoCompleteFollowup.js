$(function () {

    function splitFollow(val) {
        return val.split(/,\s*/);
    }
    function extractLastFollow(term) {
        return splitFollow(term).pop();
    }

    $("#searchFollowUser")
      // don't navigate away from the field on tab when selecting an item
      .on("keydown", function (event) {
          if (event.keyCode === $.ui.keyCode.TAB &&
              $(this).autocomplete("instance").menu.active) {
              event.preventDefault();
          }
      })
      .autocomplete({
          source:
              function (request, response) {
                  $.getJSON("/Home/GetUsers", {
                      username: extractLastFollow(request.term)
                  }, response);
              },

          search: function () {
              // custom minLength
              var term = extractLastFollow(this.value);
              if (term.length < 1) {
                  return false;
              }
          },
          focus: function () {
              // prevent value inserted on focus
              return false;
          },
          select: function (event, ui) {
              var terms = splitFollow(this.value);
              // remove the current input
              terms.pop();
              // add the selected item
              terms.push(ui.item.value);
              // add placeholder to get the comma-and-space at the end
              terms.push("");
              this.value = terms.join(", ");
              return false;
          }
      }).data("ui-autocomplete")._renderItem = function (ul, item) {
          ul.addClass('ui-autocompleteFollowup');
          var imageSrc;
          if (!item.ProfilePicId) {
              imageSrc = '../Content/Images/DefaultProfilePic.png';
          }
          else {
              imageSrc = '/Profile/RetrievePhoto?profilePicId='+ item.ProfilePicId ;
          }

          var inner_html =
               '<div class="followAutoComplete"><div class="autocompleteFollowImageWrapper"><img class="autocompleteImageWrapper" src="' + imageSrc
                + '"></div><div class="autocompleteFollowFullName"><label>' + item.FullName + '</label></div><div  class="autocompleteFollowName"><label>' + item.value + '</label></div></div>';
          return $("<li></li>")
              .data("item.autocomplete", item)
              .append(inner_html)
              .appendTo(ul);
      };
});