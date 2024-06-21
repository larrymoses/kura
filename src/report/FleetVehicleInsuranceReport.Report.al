#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59014 "Fleet Vehicle Insurance Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fleet Vehicle Insurance Report.rdlc';

    dataset
    {
        dataitem(Insurance;Insurance)
        {
            RequestFilterFields = "No.",Blocked;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Insurance;Insurance."No.")
            {
            }
            column(EffectiveDate_Insurance;Format(Insurance."Effective Date"))
            {
            }
            column(ExpirationDate_Insurance;Format(Insurance."Expiration Date"))
            {
            }
            column(PolicyNo_Insurance;Insurance."Policy No.")
            {
            }
            column(AnnualPremium_Insurance;Format(Insurance."Annual Premium"))
            {
            }
            column(PolicyCoverage_Insurance;Format(Insurance."Policy Coverage"))
            {
            }
            column(TotalValueInsured_Insurance;Insurance."Total Value Insured")
            {
            }
            column(Comment_Insurance;Insurance.Comment)
            {
            }
            column(InsuranceType_Insurance;Insurance."Insurance Type")
            {
            }
            column(LastDateModified_Insurance;Insurance."Last Date Modified")
            {
            }
            column(InsuranceVendorNo_Insurance;Insurance."Insurance Vendor No.")
            {
            }
            column(LocationCode_Insurance;Insurance."Location Code")
            {
            }
            column(Blocked_Insurance;Insurance.Blocked)
            {
            }
            column(Description_Insurance;Insurance.Description)
            {
            }
            column(InsuranceDetails_Insurance;Insurance."Insurance Details")
            {
            }
            column(VendorName_Insurance;Insurance."Vendor Name")
            {
            }
            column(VendorEmailAddress_Insurance;Insurance."Vendor Email Address")
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            dataitem("Vehicle Insurance Lines";"Vehicle Insurance Lines")
            {
                DataItemLink = "No."=field("No.");
                column(ReportForNavId_33; 33)
                {
                }
                column(RegistrationNo_VehicleInsuranceLines;"Vehicle Insurance Lines"."Registration No.")
                {
                }
                column(Type_VehicleInsuranceLines;"Vehicle Insurance Lines".Type)
                {
                }
                column(InsuranceType_VehicleInsuranceLines;"Vehicle Insurance Lines"."Insurance Type")
                {
                }
                column(Make_VehicleInsuranceLines;"Vehicle Insurance Lines".Make)
                {
                }
                column(Model_VehicleInsuranceLines;"Vehicle Insurance Lines".Model)
                {
                }
                column(FANo_VehicleInsuranceLines;"Vehicle Insurance Lines"."FA No.")
                {
                }
                column(VehicleDescription_VehicleInsuranceLines;"Vehicle Insurance Lines"."Vehicle Description")
                {
                }
                column(VehicleLocation_VehicleInsuranceLines;"Vehicle Insurance Lines"."Vehicle Location")
                {
                }
                column(No_VehicleInsuranceLines;"Vehicle Insurance Lines"."No.")
                {
                }
                column(VehicleLocationName;VehicleLocationName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"Vehicle Insurance Lines"."Vehicle Location");
                    if ResponsibilityCenter.FindSet then begin
                      VehicleLocationName:=UpperCase(ResponsibilityCenter.Name);
                      end;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        VehicleLocationName: Text[250];
}
