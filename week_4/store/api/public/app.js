response = $.ajax({
  url: "/quotes.json",
  dataType: "JSON",
  method: "GET"
});

response.success(function(data){
  var html, quotes, ul;

  var ul = $("#quotes");
  quotes = data;
  
  // use Jquery's each method to iterate through the array
  $.each(quotes, function(index, quote){
    html = "<li>";
    html += quote["text"] + " - " + quote["person"];
    html += "</li>";

  // convert the string to a jQuery object
  html = $(html);

  ul.append(html); //add the list item to the unordered list
  });

});
