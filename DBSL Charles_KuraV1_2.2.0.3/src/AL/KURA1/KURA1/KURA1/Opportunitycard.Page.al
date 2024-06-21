#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69504 "Opportunity card."
{
    PageType = Card;
    SourceTable = "Lead Management";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(Surname;Surname)
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Dates)
            {
                field("Date Filter";"Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Next Action Date";"Next Action Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Attempted";"Last Date Attempted")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Last Interaction";"Date of Last Interaction")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Opportunity details")
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Lost Reasons";"Lost Reasons")
                {
                    ApplicationArea = Basic;
                }
                field("Company No.";"Company No.")
                {
                    ApplicationArea = Basic;
                }
                field("Company Name";"Company Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("External ID";"External ID")
                {
                    ApplicationArea = Basic;
                }
                field("Duration (Min.)";"Duration (Min.)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Opportunities";"No. of Opportunities")
                {
                    ApplicationArea = Basic;
                }
                field(status;status)
                {
                    ApplicationArea = Basic;
                }
                field("Lead Type";"Lead Type")
                {
                    ApplicationArea = Basic;
                }
                field("member no";"member no")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Detailed Member Page")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = New;
            }
            action("Create Opportunity")
            {
                ApplicationArea = Basic;
                Image = ChangeTo;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                      if Type=Type::Person then begin
                        ok:=Confirm('Create an lead  for '+"First Name"+Surname +'.The inquiry will be given a new lead Number. Continue?');
                      if ok then begin
                          //Create Invest Account
                          if OppSetup.Get then begin
                            OppSetup.TestField(OppSetup."Customer App Nos");
                             OppNo:=NoSeriesMgt.GetNextNo(OppSetup."Customer App Nos",0D,true);
                             if OppNo<>'' then begin
                    /*membApp.INIT;
                        membApp."No.":="No.";
                        //membApp."First member name":="First Name";
                        membApp.Name:=Name;
                        membApp.Address:=Address;
                        membApp."ID No.":="ID No";
                        membApp."Customer Posting Group":='MEMBER';
                        //membApp."Customer Type":=membApp."Customer Type"::Member;
                        membApp.City:=City;
                        membApp."Recruited By":=USERID;
                        membApp."Registration Date":=TODAY;
                        membApp."Mobile Phone No":="Phone No.";
                        membApp.INSERT(TRUE);
                        Converted:=TRUE;
                        MODIFY;*/
                        Message('opportunity members successfully generated');
                        end;
                        end;
                        end;
                        end;
                        if Type=Type::Company then begin
                      /*employer.INIT;
                      employer.Code:="Company No.";
                      employer.Description:="Company Name";
                      employer."Join Date":=TODAY;
                      employer.INSERT(TRUE);
                      Converted:=TRUE;
                      MODIFY;*/
                      Message('opportunity organizations successfully generated');
                      end;
                      // LOAN FORM

                end;
            }
        }
    }

    var
        CustCare: Record "General Equiries.";
        CQuery: Record "General Equiries.";
        LeadM: Record "Lead Management";
        entry: Integer;
        vend: Record Vendor;
        CASEM: Record "Cases Management";
        ok: Boolean;
        OppSetup: Record "Crm General Setup.";
        OppNo: Code[10];
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

