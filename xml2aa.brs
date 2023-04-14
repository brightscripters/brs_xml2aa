
sub main()

    xmlElement = CreateObject("roXMLElement")
    
        for each file in ["test.xml", "testEmptyItems.xml", "testSingleItem.xml"]

                ' if not xmlElement.ParseFile( "test.xml" ) then
                if not xmlElement.ParseFile( file ) then
                    print "BAD XML source"
                end if

            AA = xmlElementToAA( xmlElement, "Test" ) 
            print FormatJson(AA)

        end for

end sub

' asArray - Specify element name expected to be repeated at same level
function xmlElementToAA( xmlElem as object, asArray = "Item" ) as object
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
                    ' Look for already existing key as indication of repeating names
                    if aa[name$].doesExist(childName$) then
                            ' Case where there are multiple children with same name
                            if type( aa[name$][childName$] ) <> "roArray" then
                                ' Convert aa to array
                                ' This can only happen once
                                temp = {}
                                temp.append( aa[name$][childName$] )
                                aa[name$][childName$] = []
                                aa[name$][childName$].push( temp )
                            end if
                        aa[name$][childName$].push( xmlElementToAA( child )[childName$] )
                    else
                        ' Element apparing for first time at this level
                        ' We might want to store a name as array. Like "item"...
                            if asArray = childName$ then
                                ' Start an array with aa as itme
                                aa[name$][childName$] = [ xmlElementToAA( child )[childName$] ]
                            else 
                                aa[name$][childName$] = xmlElementToAA( child )[childName$]
                            end if
                    end if
            end for

        end if

    return aa
end function
