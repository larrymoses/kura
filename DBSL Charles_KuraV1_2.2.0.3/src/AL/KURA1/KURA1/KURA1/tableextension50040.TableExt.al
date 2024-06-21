#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50040 "tableextension50040" extends "Job Journal Line" 
{
    fields
    {


        field(50020;"Shortcut Dimension 3 Code";Code[40])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[40])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[40])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "Road Code"; Code[30])
        {

            //TableRelation = "Road Inventory"."Road Code";
        }
        field(50024; "Road Section No"; Code[20])
        {

            //TableRelation = "Road Section"."Road Section No." whe("Road Code" = "=field("Road Code"));
        }
        field(50025; "Constituency ID"; Code[30])
        {

            TableRelation = Constituency.Code;
        }
        field(50026; "County ID"; Code[40])
        {

            TableRelation = County1.Code;
        }
        field(72004; "Region ID"; Code[40])
        {

            TableRelation = County1.Code;
        }
        field(72005; "Road Project Category"; Enum "Road Project Category")
        {
            // OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            // OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(72006; "Project No."; Code[40])
        {
           
        }
    }



}

