
Page 59122 "Non KeRRA Driver Allocations"
{
    PageType = ListPart;
    SourceTable = "Non-KeRRA Driver Allocation";
    Caption = 'Non-KURA Driver Allocation';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No"; Rec."ID No")
                { 
                
                    ApplicationArea = Basic;
                }
            field("DL Number"; Rec."DL Number")
                { 
                    ApplicationArea = Basic;
                }
                field("Driver Name"; Rec."Driver Name")
                { 
                    ApplicationArea = Basic;
                }
                field("Phone Number"; Rec."Phone Number")
                { 
                    ApplicationArea = Basic;
                }
                field("Email Address"; Rec."Email Address")
                { 
                    ApplicationArea = Basic;
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                { 
                    ApplicationArea = Basic;
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                { 
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}



