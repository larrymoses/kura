#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65058 "Funding Opportunity Closed"
{
    Caption = 'Funding Opportunity Announcement Card';
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Funding Opportunity";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Call No.";"Call No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Organization ID";"Organization ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Organization";"Issuing Organization")
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("Call Type";"Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Announcement No";"External Announcement No")
                {
                    ApplicationArea = Basic;
                }
                field("Release Date";"Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Due Date";"Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application date";"Application date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date";"Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page";"Home Page")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home Page';
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                group("Title Details:")
                {
                    Caption = 'Title Details:';
                    field("Opportunity Details";WorkDescription)
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        StyleExpr = true;

                        trigger OnValidate()
                        begin
                            SetWorkDescription(WorkDescription);
                        end;
                    }
                }
            }
            group("Finance Details")
            {
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity Amount";"Opportunity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity Amount(LCY)";"Opportunity Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23;Outlook)
            {
            }
            systempart(Control22;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Grants Applications")
            {
                ApplicationArea = Basic;
                Image = Grid;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Funding Application List";
                RunPageLink = "FOA ID"=field("Call No.");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := GetWorkDescription;
    end;

    var
        WorkDescription: Text;
}

