
page 99520 Graph
{
    ApplicationArea = All;
    Caption = 'Graph';
    PageType = List;
    SourceTable = "Microsoft Graphs";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the URL field.';
                }
                field("Tenant ID";Rec."Tenant ID")
                {
                   ApplicationArea = All; 
                }
                field(Host; Rec.Host)
                {

                }
                field("Client ID"; Rec."Client ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client ID field.';
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Client Secret field.';
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Scope field.';
                }
            }
        }
    }
}


