#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59131 "Vehicle Insurance Card"
{
    Caption = 'Insurance Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Insurance;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = FixedAssets;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = FixedAssets;
                    Importance = Promoted;
                    ToolTip = 'Specifies a description of the insurance policy.';
                }
                field("Insurance Vendor No."; "Insurance Vendor No.")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the number of the vendor from whom you purchased this insurance policy.';
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Contact"; "Vendor Contact")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Phone"; "Vendor Phone")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Email Address"; "Vendor Email Address")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; "Effective Date")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the date from which the insurance policy is valid.';
                }
                field("Expiration Date"; "Expiration Date")
                {
                    ApplicationArea = FixedAssets;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date to which the insurance policy is valid.';
                }
                field("Insurance Type"; "Insurance Type")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the type of insurance (for example, theft or fire) that is covered by this insurance policy.';
                }
                field("Policy No."; "Policy No.")
                {
                    ApplicationArea = FixedAssets;
                    Importance = Promoted;
                    ToolTip = 'Specifies the insurance policy number as stated on the actual insurance policy.';
                }
                field("Insurance Details"; "Insurance Details")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = Comments;
                    ToolTip = 'Specifies a search description for the insurance policy.';
                }
                field("Annual Premium"; "Annual Premium")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the amount of the annual insurance premium.';
                }
                field("Policy Coverage"; "Policy Coverage")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies the amount of coverage provided by this insurance policy.';
                }
                field("Expiry Notification Date"; "Expiry Notification Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = FixedAssets;
                    ToolTip = 'Specifies when the insurance card was last modified.';
                }
            }
            part(Control13; "Vehicle Insurance Lines")
            {
                SubPageLink = "No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ins&urance")
            {
                Caption = 'Ins&urance';
                Image = Insurance;
                action("Coverage Ledger E&ntries")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Coverage Ledger E&ntries';
                    Image = GeneralLedger;
                    RunObject = Page "Ins. Coverage Ledger Entries";
                    RunPageLink = "Insurance No." = field("No.");
                    RunPageView = sorting("Insurance No.", "Disposed FA", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View insurance ledger entries that were created when you post to an insurance account from a purchase invoice, credit memo or journal line.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Insurance),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //  RunObject = Page "Default Dimensions";
                    // RunPageLink = "Table ID" = const(5628),
                    //               "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                separator(Action24)
                {
                }
                action(Statistics)
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Insurance Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View detailed historical information about the fixed asset.';
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        // VehicleInsuranceLines.RESET;
                        // VehicleInsuranceLines.SETRANGE(VehicleInsuranceLines."No.","No.");
                        // IF VehicleInsuranceLines.FINDSET THEN
                        //  REPEAT
                        // FleetVehicles.RESET;
                        // FleetVehicles.SETRANGE(FleetVehicles."No.",VehicleInsuranceLines."FA No.");
                        // FleetVehicles.SETRANGE(FleetVehicles."Registration No.",VehicleInsuranceLines."Registration No.");
                        // IF FleetVehicles.FINDSET THEN BEGIN
                        //  FleetVehicles."Licensing Company":= "Vendor Name";
                        //  FleetVehicles."Date of Last Insurance":="Effective Date";
                        //  FleetVehicles."Expiry Date":="Expiration Date";
                        //  FleetVehicles."Licensing Details":="Insurance Details";
                        // //  IF NOT FleetVehicles.GET(FleetVehicles."No.",FleetVehicles."Registration No.") THEN
                        //    FleetVehicles.MODIFY;
                        //  END;
                        // UNTIL VehicleInsuranceLines.NEXT=0;
                    end;
                }
                action("Notify of Expiry")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if HRSetup.Get() then begin
                            Header := ' INSURANCE ' + "No." + ' EXPIRY NOTIFICATION ';

                            if SMTPSetup.Get() then begin
                                SenderEmail := SMTPSetup."Email Address";
                                SenderName := SMTPSetup."Email Address";
                            end;
                            if HRSetup."HR E-mail Address" <> '' then begin
                                //   //SMTPMail.CreateMessage(SenderName,SenderEmail,HRSetup."HR E-mail Address",Header,'',true);
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('Dear Sir/Madam,');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('Please note that the insurance '+Rec."No."+' is about to expire on '+Format("Expiration Date"));// for the month of January 2014');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('<br>');
                                //   //SMTPMail.AddBodyline('Kindly prepare adequately');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('Thanks & Regards');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline(SenderName);
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('<HR>');
                                //   //SMTPMail.AddBodyline('This is a system generated mail.');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
                                //   //SMTPMail.AddBodyline('<br><br>');
                                //   //SMTPMail.Send;
                                Message('Mail sent to %1', HRSetup."HR E-mail Address");
                            end;
                            //End email
                        end;

                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Insurance.Reset;
                        Insurance.SetRange(Insurance."No.", "No.");
                        Report.Run(59014, true, true, Insurance);
                    end;
                }
                action("Total Value Ins&ured per FA")
                {
                    ApplicationArea = FixedAssets;
                    Caption = 'Total Value Ins&ured per FA';
                    Image = TotalValueInsuredperFA;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Total Value Insured per FA";
                    ToolTip = 'View, in a matrix window, the amount of insurance registered with each insurance policy. These are the insurance-related amounts that you posted from a journal.';
                }
            }
        }
        area(reporting)
        {
            action(List)
            {
                ApplicationArea = FixedAssets;
                Caption = 'List';
                Image = OpportunitiesList;
                Promoted = true;
                PromotedCategory = "Report";
                //   RunObject = Report "Insurance - List";
                ToolTip = 'View or edit the list of insurance policies in the system.';
            }
            action("Uninsured FAs")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Uninsured FAs';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //  RunObject = Report "Insurance - Uninsured FAs";
                ToolTip = 'View the individual fixed assets for which amounts have not been posted to an insurance policy. For each fixed asset, the report shows the asset''s acquisition cost, accumulated depreciation, and book value.';
            }
            action("Tot. Value Insured")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Tot. Value Insured';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //   RunObject = Report "Insurance - Tot. Value Insured";
                ToolTip = 'View each fixed asset with the amounts that you posted to each insurance policy. The entries in this report correspond to all of the entries in the Ins. Coverage Ledger Entry table. The amounts shown for each asset can be more or less than the actual insurance policy''s coverage. The amounts shown can differ from the actual book value of the asset.';
            }
            action("Coverage Details")
            {
                ApplicationArea = FixedAssets;
                Caption = 'Coverage Details';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //  RunObject = Report "Insurance - Coverage Details";
                ToolTip = 'View the individual fixed assets that are linked to each insurance policy. For each insurance policy, the report shows one or more amounts for each asset. These are the amounts that need insurance coverage. These amounts can differ from the actual insurance policy''s coverage.';
            }
            action(Register)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Register';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = "Report";
                // RunObject = Report "Insurance Register";
                ToolTip = 'View registers containing all the fixed asset entries that are created. Every register shows the first and last entry number of its entries.';
            }
            action(Analysis)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //  RunObject = Report "Insurance - Analysis";
                ToolTip = 'View an analysis of your fixed assets with various types of data for both individual assets and groups of assets.';
            }
        }
    }

    var
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        HRSetup: Record "Human Resources Setup";
        FleetVehicles: Record "Fleet Vehicles.";
        VehicleInsuranceLines: Record "Vehicle Insurance Lines";
        Insurance: Record Insurance;
}

