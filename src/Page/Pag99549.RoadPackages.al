page 99549 "Road Packages"
{
    ApplicationArea = All;
    Caption = 'Road Packages';
    PageType = List;
    SourceTable = "Road Packages";
    UsageCategory = Lists;
    PopulateAllFields =true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Package;Rec.Package)
                {
                    ApplicationArea=Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea=Basic;
                }
                field("Works Type";Rec."Works Type")
                {
                    ApplicationArea =Basic;
                }
                  field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                   ApplicationArea=Basic; 
                }
                   field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                   ApplicationArea=Basic; 
                }
                   field("Shortcut Dimension 3 Code";Rec."Shortcut Dimension 3 Code")
                {
                   ApplicationArea=Basic; 
                   Visible=false;
                }
                   field("Shortcut Dimension 4 Code";Rec."Shortcut Dimension 4 Code")
                {
                   ApplicationArea=Basic; 
                   Visible =false;
                }
                   field("Shortcut Dimension 5 Code";Rec."Shortcut Dimension 5 Code")
                {
                   ApplicationArea=Basic; 
                }
            }
        }
    }
}
