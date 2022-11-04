<script>
    const report = new Map();
    const dates = new Map();
</script>
<%
    set fso = Server.CreateObject("Scripting.FileSystemObject")
    set din = fso.OpenTextFile("\\192.168.100.87\WebServices\vbrreport\includes\VBRMainRecord.csv")
    response.write("<script>")
        txt = din.ReadLine
        do while not din.AtEndOfStream
            txt = din.ReadLine
            txt = Split(txt, ",")
            dates = Split(txt(1))
            'js that checks map for Veeam B&R report name and sets it if it does not exist
            'if report name does exist, append value
            response.write("if(!report.has("& txt(0) &"))")
            response.write("{report.set(" & txt(0) & ",[" & txt(1) & "]);}")
            response.write("else{report.get(" & txt(0) &").push(" & txt(1) &");}")

            'js that checks map for date and sets it if it does not exist
            'the amount of days depends on the generated CSV from SCHBackup
            response.write("if(!dates.has(" & dates(0) & """))")
            response.write("{dates.set(" & dates(0) & """);}")
        loop
    response.write("</script>")
    din.Close
%>