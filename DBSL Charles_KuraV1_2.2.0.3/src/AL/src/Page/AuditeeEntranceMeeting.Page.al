#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95228 "Auditee Entrance Meeting"
{
    PageType = Card;
    SourceTable = "Audit Mobilization Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting No.';
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Commencement Notice No.";"Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Entrance Meeting Agenda";"Entrance Meeting Agenda Line")
            {
                Caption = 'Entrance Meeting Agenda';
                SubPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Meeting Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No.","Document No.");
                    Report.Run(95017,true,true,Rec);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('closed');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Dimension Set Entries";

                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Attendance)
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Entrace Meeting Attendances";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Engagement ID"=field("Engagement ID");
            }
        }
    }
}

