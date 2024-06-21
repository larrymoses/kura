#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69651 "Career Fair"
{
    // PageType = Card;
    // SourceTable = "Vacancy Announcement";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Announcement No.";"Announcement No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Document Date";"Document Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created On";"Created On")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created Time";"Created Time")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Career Fair Venue";"Career Fair Venue")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Career Fair Date";"Career Fair Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Career Fair Start Time";"Career Fair Start Time")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Career Fair End Time";"Career Fair End Time")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("No. of Participants";"No. of Participants")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("HR Officer User ID";"HR Officer User ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("HR Officer Staff No.";"HR Officer Staff No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Staff Name";"Staff Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Directorate;Directorate)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Department;Department)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Region;Region)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Financial Year Code";"Financial Year Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date Published";"Date Published")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Approval Status";"Approval Status")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part(Control5;"Career Fair Attendance")
    //         {
    //             SubPageLink = "Career Fair ID"=field("Announcement No.");
    //         }
    //         group("Employer Profile")
    //         {
    //             field("Organization Name";"Organization Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Organization Overview";"Organization Overview")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Address;Address)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Address 2";"Address 2")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(City;City)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Post Code";"Post Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Country/Region Code";"Country/Region Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Phone No.";"Phone No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Contact;Contact)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Email;Email)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Home Page";"Home Page")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control41;Outlook)
    //         {
    //         }
    //         systempart(Control42;Notes)
    //         {
    //         }
    //         systempart(Control43;MyNotes)
    //         {
    //         }
    //         systempart(Control44;Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         group("Actions")
    //         {
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     Message('Approval Request has been approved');
    //                     "Approval Status":="approval status"::Released;
    //                     Modify(true);
    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 PromotedIsBig = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page "Approval Entries";
    //                 begin
    //                     //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
    //                     ApprovalEntries.Setfilters(Database::"Purchase Header",14,Rec."Announcement No.");
    //                     ApprovalEntries.Run;
    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Enabled = true;
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     Message('Approval Request has been cancelled');
    //                     "Approval Status":="approval status"::Open;
    //                     Modify(true);
    //                 end;
    //             }
    //             action("E-Notify Candidates")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'E-Notify Candidates';
    //                 Image = PostedPutAway;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ShortCutKey = 'Ctrl+F9';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     if Confirm('Are you sure you want to advertise the vacancies on this document?')=true then begin
    //                     Recruitment.NotifyAtendees(Rec);
    //                       Posted:=true;
    //                      "Posted By":=UserId;
    //                      "Posted On":=CurrentDatetime;
    //                      Modify(true);
    //                      end;

    //                      //create ledger entries
    //                 end;
    //             }
    //         }
}
