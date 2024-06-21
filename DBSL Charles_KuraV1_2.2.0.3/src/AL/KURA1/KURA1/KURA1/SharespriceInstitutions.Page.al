#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57084 "Shares price Institutions"
{
    PageType = List;
    SourceTable = "EFT Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Member No"; "Member No")
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
            action("Update Shares")
            {
                ApplicationArea = Basic;
                Image = UpdateShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Institutions.Reset;
                    Institutions.SetRange("Header No", "Header No");
                    if Institutions.Find('-') then begin
                        repeat
                            EquityShares.Reset;
                            EquityShares.SetRange(Institution, Institutions.No);
                            EquityShares.SetRange("Asset Type", EquityShares."asset type"::Equity);
                            EquityShares.SetRange(UnitTrust, false);
                            EquityShares.SetRange(Offshore, false);
                            if EquityShares.Find('-') then begin
                                repeat
                                    InterestRates.Init;
                                    InterestRates.No := EquityShares."No.";
                                    InterestRates.Name := EquityShares.Description;
                                    /* InterestRates.Date:="Member No";
                                    InterestRates."Current Market Value":="Account No"; */
                                    InterestRates.Validate(InterestRates."Current Market Value");
                                    InterestRates."Header No" := "Header No";
                                    InterestRates."Dimension Set ID" := EquityShares."Dimension Set ID";
                                    InterestRates.Insert(true);

                                until EquityShares.Next = 0;
                            end;
                        until Institutions.Next = 0;
                    end;

                    Message('Equity Shares updated Successfully.');
                end;
            }
        }
    }

    var
        InterestRates: Record "Investment History";
        EquityShares: Record "Investment Asset";
        Institutions: Record "EFT Details";
}

