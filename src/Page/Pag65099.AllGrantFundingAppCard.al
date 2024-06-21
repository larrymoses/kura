#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65099 "All Grant Funding App Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Grant Funding Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No";"Application No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("FOA ID";"FOA ID")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No";"External Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opportunity  Title";"Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Call Type";"Call Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grant Type";"Grant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Justification for Application";"Justification for Application")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center";"Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Program ID";"Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Research Area";"Primary Research Area")
                {
                    ApplicationArea = Basic;
                }
                field("Principal Investigator";"Principal Investigator")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code";"Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Application Status";"Application Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Closed Date";"Closed Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Award Info")
            {
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if "Posting Date" <> 0D then
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
                        else
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WorkDate);
                        if ChangeExchangeRate.RunModal = Action::OK then begin
                          Validate("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.Update;
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                        //SalesCalcDiscountByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field("Requested Grant Amount";"Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Grant Amount(LCY)";"Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount";"Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Grant Amount (LCY)";"Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Deadlines && Dates")
            {
                field("Application Due Date";"Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Submitted Date";"Application Submitted Date")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Award Date";"Estimated Award Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Grantor Information")
            {
                field("Grantor No.";"Grantor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Name";"Grantor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2;Address2)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No";"Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No";"Mobile Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Contact ID";"Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Research Reviewer";"Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grantor Admin Contact ID";"Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Admin Name";"Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Grantor Finance Contact ID";"Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Finance Contact";"Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control46;Outlook)
            {
            }
            systempart(Control47;Notes)
            {
            }
            systempart(Control48;MyNotes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Research Approval Committees")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
}

