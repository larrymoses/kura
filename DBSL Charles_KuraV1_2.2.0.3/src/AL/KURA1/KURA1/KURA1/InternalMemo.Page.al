#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56066 "Internal Memo"
{
    PageType = Card;
    SourceTable = "Internal Memos";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(RE;RE)
                {
                    ApplicationArea = Basic;
                }
                field("Employee UserID";"Employee UserID")
                {
                    ApplicationArea = Basic;
                }
                field(From;From)
                {
                    ApplicationArea = Basic;
                }
                field("To CEO";"To CEO")
                {
                    ApplicationArea = Basic;
                }
                field(Through;Through)
                {
                    ApplicationArea = Basic;
                }
                field("Paragraph 1";"Paragraph 1")
                {
                    ApplicationArea = Basic;
                }
                field("Paragraph 2";"Paragraph 2")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By Date";"Prepared By Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By";"Approved By")
                {
                    ApplicationArea = Basic;
                }
                field("CEO Approval";"CEO Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Approved By Date";"Approved By Date")
                {
                    ApplicationArea = Basic;
                }
                field("CEO Approval Date";"CEO Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("CEO Comments";"CEO Comments")
                {
                    ApplicationArea = Basic;
                }
                field("HOD ID";"HOD ID")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control21;"Memo Lines")
            {
                SubPageLink = Code=field(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetRange(Code,Code);
                    Report.Run(56237,true,true,Rec);
                end;
            }
        }
    }
}

