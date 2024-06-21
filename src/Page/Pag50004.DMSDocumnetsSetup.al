#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50004 "DMS Documnets Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "DMS Documents";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Sharepoint URL"; Rec."Sharepoint URL")
                {
                    ApplicationArea = Basic;
                }
                field("Document Path"; Rec."Document Path")
                {
                    ApplicationArea = Basic;
                }
                field("Library Name"; Rec."Library Name")
                {
                    ApplicationArea = Basic;
                }
                field("Folder Name"; Rec."Folder Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

