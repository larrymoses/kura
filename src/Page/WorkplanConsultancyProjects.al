
page 99667 "Workplan Consultancy Projects"
{
    PageType = List;
    SourceTable ="Workplan Consultancy Projects";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Consultancy Project Type"; Rec."Consultancy Project Type")
                {
                    ApplicationArea=Basic;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Consultancy Project Category"; Rec."Consultancy Project Category")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Bridge Location (KM)"; Rec."Bridge Location (KM)")
                {
                    Enabled = Rec."Consultancy Project Category" = Rec."Consultancy Project Category"::"Geotechnical Investigations";
                    ApplicationArea=Basic;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea=Basic;
                    Editable = false;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    Editable = false;
                    ApplicationArea=Basic;
                }
            }
        }
    }

    actions
    {
    }
}



