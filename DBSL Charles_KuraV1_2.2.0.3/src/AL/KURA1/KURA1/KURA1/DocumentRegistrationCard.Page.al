#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56048 "Document Registration Card"
{
    PageType = Card;
    SourceTable = "Document registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if DocType.Get("Document Type") then begin
                          if DocType."Require Court Date?"=true then
                            Court:=true
                          else
                            Court:=false
                        end;
                    end;
                }
                group(".")
                {
                    Caption = '.';
                    Visible = Court;
                    field("Court Date";"Court Date")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Document Sub Type";"Document Sub Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Description";"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document Origin";"Document Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Accused Name";"Accused Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned Investigator";"Assigned Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Court Rank";"Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station";"Court Station")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19;Outlook)
            {
            }
            systempart(Control20;Notes)
            {
            }
            systempart(Control21;MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        Court:=false;
    end;

    trigger OnInit()
    begin
        Court:=false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        RegistrationType:=Registrationtype::Document;
    end;

    trigger OnOpenPage()
    begin
        Court:=false;
    end;

    var
        Court: Boolean;
        DocType: Record "Case Document Types";
}

