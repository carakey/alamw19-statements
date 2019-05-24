declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare option saxon:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option saxon:output "omit-xml-declaration=yes";
declare option saxon:output "indent=yes";

<html>

<head>
    <title>{'List of Titles by Attribute Value'}</title>
</head>
    
<body>
    <h1>List of Titles by Attribute Value in ALAMW19 Statements</h1>
    <div>
        <h2>{'Titles by Focus'}</h2>
            <h3>{'Focus = Racism'}</h3>
            <ul>            
            {
                for $title in //docTitle[@focus='racism']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Focus = Violations'}</h3>
            <ul>            
            {
                for $title in //docTitle[@focus='violations']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Focus = Incidents'}</h3>
            <ul>            
            {
                for $title in //docTitle[@focus='incidents']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Focus = EDI'}</h3>
            <ul>            
            {
                for $title in //docTitle[@focus='edi']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Focus = Unspecified'}</h3>
            <ul>            
            {
                for $title in //docTitle[@focus='unspecified']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
        </div>
    <div>
        <h2>{'Titles by Context'}</h2>
            <h3>{'Context = ALAMW19'}</h3>
            <ul>            
            {
                for $title in //docTitle[@context='alamw19']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Context = Profession'}</h3>
            <ul>            
            {
                for $title in //docTitle[@context='profession']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
            <h3>{'Context = Unspecified'}</h3>
            <ul>            
            {
                for $title in //docTitle[@context='unspecified']/normalize-space()
                order by $title
                return       
                    <li>{$title}</li>
            }
            </ul>
    </div>
</body>
</html>