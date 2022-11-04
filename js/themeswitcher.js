//uses localstorage
window.onload=function()
{
    var theme = localStorage.getItem('data-theme');

    console.log(theme);

    if(theme=='green')
    {
        document.documentElement.setAttribute('data-theme', 'green');
        document.getElementById("themepicker").value = "green";
    }
    else if(theme=='dark')
    {
        document.documentElement.setAttribute('data-theme', 'dark');
        document.getElementById("themepicker").value = "dark";
    }
    else if(theme == 'sch')
    {
        document.documentElement.setAttribute('data-theme', 'sch');
        document.getElementById("themepicker").value = "sch";
    }
    else if(theme == 'lcars')
    {
        document.documentElement.setAttribute('data-theme', 'lcars');
        document.getElementById("themepicker").value = "lcars";
    }
    else
    {
        document.documentElement.setAttribute('data-theme', 'default');
        document.getElementById("themepicker").value = "default";
    }
         
}
function switchTheme(control)
{
    if(control.value =='dark')
    {
        document.documentElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('data-theme','dark');
    }
    else if(control.value  == 'green')
    {
        document.documentElement.setAttribute('data-theme', 'green');
        localStorage.setItem('data-theme','green');
    }
    else if(control.value == 'sch')
    {
        document.documentElement.setAttribute('data-theme', 'sch');
        localStorage.setItem('data-theme','sch');
    }
    else if(control.value == 'lcars')
    {
        document.documentElement.setAttribute('data-theme', 'lcars');
        localStorage.setItem('data-theme','lcars');
    }
    else
    {
        document.documentElement.setAttribute('data-theme', 'default');
        localStorage.setItem('data-theme','default');
    }
};