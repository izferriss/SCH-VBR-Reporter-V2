<!--#include file="includes/main.asp" -->
<% Sub Title %>
    VBR Reporting
<% End Sub %>

<% Sub Includes %>
    <script src="js/Sortable.js"></script>
    <!--#include file="includes/themepicker.asp" -->
    <!--#include file="includes/vbrreporthandler.asp" -->
<% End Sub %>

<% Sub Content %>
    <DIV class="wrapper">
        <DIV class ="tablecontainer">
            <TABLE class="sortable">
                <THEAD>
                    <TR>
                        <TH class="reportname" > Report Name </TH>
                        <script>
                            //STARTING AT ONE KEEPS OUTPUT TO 14 DAYS
                            for(var i = 1; i < dates.size; i++)
                            {
                                if(i == dates.size - 1)
                                {
                                    document.write("<TH class=\"dates\" id=\"last-col\">");
                                }
                                else
                                {
                                    document.write("<TH class=\"dates\">");
                                }

                                document.write(Array.from(dates.keys())[i]);
                                document.write("</TH>");
                            }
                        </script>
                    </TR>
                </THEAD>
                <TBODY>
                    <script>
                        for(var i = 0; i < report.size; i++)
                        {
                            //Row
                            document.write("<TR>");

                                // Report Name
                                document.write("<TD class=\"reportname\">");
                                    document.write(Array.from(report.keys())[i]);
                                document.write("</TD>");

                                //For each date, write times
                                //STARTING AT ONE KEEPS OUTPUT TO 14 DAYS
                                for(var j = 1; j < dates.size; j++)
                                {
                                    document.write("<TD class=\"times\" id=\"" + i.toString() + "-" + j.toString() + "\">");
                                        var temp = report.get(Array.from(report.keys())[i]);
                                        for(var k = 0; k < temp.length; k++)
                                        {
                                            if(temp[k].substring(0, temp[k].indexOf(" ")) == (Array.from(dates.keys())[j]).toString())
                                            {
                                                var timestring = temp[k].substring(temp[k].indexOf(" ") + 1, temp[k].length);
                                                var hours, minutes, ampm;
                                                ampm = timestring.substring(timestring.indexOf(" ") + 1);
                                                hours = timestring.substring(0, 1).padStart(2, "0");
                                                minutes = timestring.substring(3, timestring.indexOf(" ")).padStart(5, "0");
                                                if(ampm == "AM" && hours == "12")
                                                {
                                                    hours = 0;
                                                }
                                                if(ampm == "PM")
                                                {
                                                    hours = parseInt(hours) + 12;
                                                }
                                                document.write(hours + ":" + minutes + "<BR>");
                                                var thiscell = document.getElementById(i.toString() + "-" + j.toString());
                                                var datasort = parseInt(hours + minutes.substring(0, 1) + minutes.substring(3))
                                                thiscell.setAttribute("data-sort", datasort);
                                            }
                                        }
                                    document.write("</TD>");
                                }
                            document.write("</TR>");
                        }
                        //one row for each key in report map
                        //if date value matches table header, insert time into cell
                    </script>
                </TBODY>
            </TABLE>
        </DIV> <!-- end table container div -->
    </DIV> <!-- end wrapper div -->
    <script>
    //This is for default behavior of sort
    //Sort by date on load
    window.addEventListener('load', function ()
    {
        const el = document.getElementById('last-col');
        if (el)
        {
            //click twice to make ascending
            el.click();
        }
    });
</script>
<% End Sub %>