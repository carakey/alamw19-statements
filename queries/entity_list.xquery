declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare option saxon:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option saxon:output "omit-xml-declaration=yes";
declare option saxon:output "indent=yes";

<html>

<head>
    <title>{'List of Entities by Type'}</title>
</head>
    
<body>
    <h1>List of Entities by Type in ALAMW19 Statements</h1>
    <div>
        <h2>{'People'}</h2>
        <ul>            
        {
            for $person in //entity[@type='person']/normalize-space()
            group by $person
            order by $person
            return       
                <li>{$person}</li>
        }
        </ul>

        <h2>{'Organizations'}</h2>
        <ul>
        {
            for $organization in //entity[@type='organization']/normalize-space()
            group by $organization
            order by $organization
            return
                <li>{$organization}</li>
        }
        </ul>

        <h2>{'Events'}</h2>
        <ul>            
        {
            for $event in //entity[@type='event']/normalize-space()
            group by $event
            order by $event
            return       
                <li>{$event}</li>
        }
        </ul>

        <h2>{'Places'}</h2>
        <ul>            
        {
            for $place in //entity[@type='place']/normalize-space()
            group by $place
            order by $place
            return       
                <li>{$place}</li>
        }
        </ul>

        <h2>{'Programs'}</h2>
        <ul>            
        {
            for $program in //entity[@type='program']/normalize-space()
            group by $program
            order by $program
            return       
                <li>{$program}</li>
        }
        </ul>

        <h2>{'Protected Groups'}</h2>
        <ul>            
        {
            for $group in //entity[@type='protected_group']/normalize-space()
            group by $group
            order by $group
            return       
                <li>{$group}</li>
        }
        </ul>

        <h2>{'Functional Areas'}</h2>
        <ul>            
        {
            for $area in //entity[@type='functional_area']/normalize-space()
            group by $area
            order by $area
            return       
                <li>{$area}</li>
        }
        </ul>
    </div>
</body>
</html>