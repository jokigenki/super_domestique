var time = argument[0];
var hours = floor(time / 60);
var minutes = time - (hours * 60);
var am = "am";
if (hours > 12) {
    hours -= 12;
    am = "pm";
}
var hoursString = string(hours);
if (hours < 10) hoursString = "0" + hoursString;
var minutesString = string(minutes);
if (minutes < 10) minutesString = "0" + minutesString;

return hoursString + ":" + minutesString + am;
