
sub main()

    xmlElement = CreateObject("roXMLElement")
      
        if not xmlElement.ParseFile( "test.xml" ) then
            print "BAD XML source"
        end if

    AA = xmlElementToAA( xmlElement ) 

    print FormatJson(AA)

end sub


function xmlElementToAA( xmlElem as object ) as object
    aa = {}
    name$ = xmlElem.getName()
    '{ <tag name>:{ attributes... } } or {}
    aa.addReplace( name$, xmlElem.GetAttributes() )

        ' No children, might have text
        if xmlElem.GetChildElements() = invalid
            text = xmlElem.getText()
                
                'Has text
                if text <> invalid and text <> "" then
                    
                    ' Without attributes
                    if aa[name$].isEmpty()
                        aa[name$] = text
                    else
                        aa[name$].text = text
                    end if 
                end if
        
        ' Has children    
        else

            for each child in xmlElem.GetChildElements()
                childName$  = child.getName()
                    ' Use Array?
                    if aa[name$].doesExist(childName$) then
                            if type( aa[name$][childName$] ) <> "roArray" then
                                temp = {}
                                temp.append( aa[name$][childName$] )
                                aa[name$][childName$] = []
                                aa[name$][childName$].push( temp )
                            end if
                        aa[name$][childName$].push( xmlElementToAA( child )[childName$] )
                    else
                        aa[name$][childName$] = xmlElementToAA( child )[childName$]
                    end if
            end for

        end if

    return aa
end function
