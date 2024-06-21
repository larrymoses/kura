#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75288 "Purchase Contract Milestone"
{
    Caption = 'Contract Milestones';
    PageType = List;
    SourceTable = "Purchase Contract Milestone";
    PopulateAllFields =true;
     PromotedActionCategories = 'New,Process,Report,Send,Deliverables';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Milestone Number';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Deliverables"; Rec."Milestone Deliverables")
                {
                    ApplicationArea = Basic;
                }
                field("No of IPCs"; Rec."No of IPCs")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Instalment Code"; Rec."Payment Instalment Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'IPC No';
                    LookupPageID = "Purchase Contract Payment Term";
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Engineer''s Signature Date';
                    Editable = false;
                    Visible = true;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Date';
                    Editable = false;
                    Visible = true;
                }
                field("Date Notified"; Rec."Date Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Deliverables)
            {
                Promoted = true;
                PromotedCategory = Category5;
                ApplicationArea = Basic;
                 trigger OnAction()
                    var
                        Deliverable: Record "Contract Milestone Deliverable";
                        Deliverables: Page "Contract Milestone Deliverable";
                    begin
                        Rec.TestField("No.");
                        Rec.TestField("Milestone Code");
                        Deliverable.FilterGroup(2);
                        Deliverable.SetRange("Contract No.", Rec."No.");
                        Deliverable.SetRange("Milestone Code",Rec."Milestone Code");
                        Deliverable.SetRange("Milestone Entry No.",Rec."Entry No");
                        Deliverable.FilterGroup(0);
                        Deliverables.SetTableView(Deliverable);
                        Deliverables.Editable := true;
                        Deliverables.Run();
                    end;
            }
            action("Notify on Milestone")
            {
                ApplicationArea = Basic;
                Caption = 'Notify on selected Milestones';
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    Body: Text;
                    SMTP: Codeunit Mail;
                    Email: Text;
                    Email2: Text;
                    SMTPMailSetup: Record "Email Account";
                    PurchaseHeader: Record "Purchase Header";
                    Vendor: Record Vendor;
                begin

                    //     //notify attendees
                    //     PurchaseHeader.Reset;
                    //     PurchaseHeader.SetRange("No.","No.");
                    //     if PurchaseHeader.Find('-') then begin
                    //        Vendor.SetRange("No.",PurchaseHeader."Buy-from Vendor No.");
                    //        if Vendor.Find('-') then begin

                    //      SMTPMailSetup.Get;
                    //      Body:='Contract Milestone Completion';
                    //      Email:=SMTPMailSetup."Email Address";
                    //      Email2:=Vendor.Email;
                    //      SMTP.CreateMessage('KeRRa',Email,Email2,'Contract Notification',Body,true);
                    //      SMTP.AddBodyline('Thank you for the continued support.<BR>');
                    //     // SMTP.AddCC(Email2);
                    //      SMTP.AddBodyline('<BR><BR><b>Kind Regards,'+'<BR><BR>The Procurement Department<BR>');
                    //      SMTP.Send();

                    //     Message('Notification Sent successfully');
                    //   end;
                    // end;
                end;
            }
        }
    }
}

