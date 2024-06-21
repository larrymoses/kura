#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69271 "HR Shortlisting Oral Lines"
{
    Caption = 'Shorlisted Candidates';
    Editable = true;
    PageType = ListPart;
    SourceTable = "HR Shortlisted Applicants";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Qualified for Oral Interview";"Qualified for Oral Interview")
                {
                    ApplicationArea = Basic;
                }
                field("Job Application No";"Job Application No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("ID No";"ID No")
                {
                    ApplicationArea = Basic;
                }
                field("Stage Score";"Stage Score")
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(Qualified;Qualified)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employed';
                }
                field("Reporting Date";"Reporting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Manual Change";"Manual Change")
                {
                    ApplicationArea = Basic;
                    Caption = 'Manual Change';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Send Interview Invitation")
            {
                ApplicationArea = Basic;
                Caption = '&Send Interview Invitation';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    TestField("Qualified for Written Intervie");


                    HRJobApplications.SetFilter(HRJobApplications."Application No","Job Application No");
                    Report.Run(53940,false,false,HRJobApplications);
                end;
            }
            action("&Print1")
            {
                ApplicationArea = Basic;
                Caption = '&Print1';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;

                trigger OnAction()
                begin
                    HRJobApplications.Reset;
                    HRJobApplications.SetRange(HRJobApplications."Application No","Job Application No");
                    if HRJobApplications.Find('-') then
                    Report.Run(55523,true,true,HRJobApplications);
                end;
            }
        }
    }

    var
        MyCount: Integer;
        HRJobApplications: Record "HR Job Applications";


    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}

