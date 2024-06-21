/// <summary>
/// Page Admin Role Center (ID 50039).
/// </summary>
page 50039 "Admin Role Center"
{
    Caption = 'Admin Role Center';
    PageType = RoleCenter;

    actions
    {
        area(Sections)
        {
            group("File Movement Management")
            {
                group(Adminstration)
                {
                    action(FileMovementSetup)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'File Movement Setup';
                        RunObject = Page "File Movement SetUp";
                    }
                }
                group("File Creation")
                {
                    action(FileRegistry)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Registry List';
                        RunObject = Page "Registry List";
                    }
                    action(FileTypes)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'File Types';
                        RunObject = Page "File Types";
                    }
                }
                group("File Movement")
                {
                    action(FileRequisitionLists)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'File Requisition List';
                        RunObject = Page "File Movement List";
                    }
                    action(PendingFileRequisitionLists)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Pending File Requisition List';
                        RunObject = Page "Pending File Requisition";
                    }
                    action(ApprovedFileRequisitionLists)
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Approved File Requisition List';
                        RunObject = Page "Approved File Requisition";
                    }
                }
                group("File Dispatch")
                {
                    action("Issued File Requisition List")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Issued File Requisition List';
                        RunObject = Page "Issued File Requisition";
                    }
                    action("Returned File Requisition List")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Returned File Requisition List';
                        RunObject = Page "Returned File Requisition";
                    }
                }
            }
            group("Fleet Management")
            {
                action("Fleet Management Setup")
                {
                    ApplicationArea = BasicAdmin;
                    Caption = 'Setup';
                    RunObject = Page "Fleet Management Setup";
                }
                group("Fleet Mgmt.")
                {
                    action("Fleet Vehicle Categories")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fleet Vehicle Categories';
                        RunObject = Page "Fleet Vehicle Categories";
                    }
                    action("Fleet Vehicles")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fleet Vehicles';
                        RunObject = page "Fleet Vehicles List";
                    }
                    action("Fleet Drivers")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fleet Drivers';
                        RunObject = page "Fleet Drivers List";
                    }
                    action("Vehicle Ins.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Vehicle Insurances';
                        RunObject = page "Vehicle Insurance List";
                    }
                    action("Vehicle Inspections")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Vehicle Inspections';
                        RunObject = page "Vehicle Inspection List";
                    }
                    action("Fleet Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Open Transport Requisitions';
                        RunObject = page "Fleet Requisition List";
                    }
                    action("Pending Fleet Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Pending Transport Requisitions';
                        RunObject = page "Pending Fleet Requests List";
                    }
                    action("Approved Fleet Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Approved Transport Requisitions';
                        RunObject = page "Approved Fleet Requests List";
                    }
                    action("Open Maintenance Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Open Maintenance Req.';
                        RunObject = page "Open Maintenance Requests";
                    }
                    action("Pending Maintenance Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Pending Maintenance Req.';
                        RunObject = page "Pending Maintenance Requests";
                    }
                    action("Approved Maintenance Req.")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Approved Maintenance Req.';
                        RunObject = page "Approved Maintenance Requests";
                    }
                    action("Fuel Requests List")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Requests List';
                        RunObject = page "Fuel Requests List";
                    }
                    action("Pending Fuel Requests")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Pending Fuel Requests';
                        RunObject = page "Pending Fuel Requests";
                    }
                    action("Approved Fuel Requests")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Approved Fuel Requests';
                        RunObject = page "Approved Fuel Requests";
                    }
                }
                group("Fuel Card")
                {
                    action("Fuel Card Allocations")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Cards Allocations';
                        RunObject = page "Fuel Allocations";
                    }
                    action("Fuel Cards")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Cards List';
                        RunObject = page "Fuel Card List";
                    }
                    action("Fuel TopUp")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Top-Up List';
                        RunObject = page "Fuel Top Up List";
                    }
                    action("Pending Fuel TopUp")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Pending Fuel Top-Up Req.';
                        RunObject = page "Pending Fuel TopUp Req.";
                    }
                    action("Appr. Fuel TopUp")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Approved Fuel Top-Up Req.';
                        RunObject = page "Approved Fuel TopUp Req.";
                    }
                }
                group("Fleet Reports")
                {
                    action("Fuel Consumption")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Consumption';
                        RunObject = Report "Fuel Consumption";
                    }
                    action("Fuel Card Deductions")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Card Deductions';
                        RunObject = Report "Fuel Card Entries";
                    }
                    action("Fuel Reconciliation")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fuel Reconciliation';
                        RunObject = Report "Fuel Reconciliation";
                    }
                    action("Fleet Maintenance Report")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Fleet Maintenance Report';
                        RunObject = Report "Vehicle M Requisitions";
                    }
                    action("Transport Allocation Report")
                    {
                        ApplicationArea = BasicAdmin;
                        Caption = 'Transport Allocation Report';
                        RunObject = Report "Transport Allocation";
                    }
                }
            }
            group("Occupational Safety & Health")
            {
                group("OSH Governance & Planning")
                {
                    group("Lists and Tasks")
                    {
                        action("Board")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Board';
                            RunObject = page 80014;
                        }
                        action("Directorates")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Directorates';
                            RunObject = page 80016;
                        }
                        action("Sections")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Sections';
                            RunObject = page 80020;
                        }
                        action("OSH Mnagement Roles")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Mnagement Roles';
                            RunObject = page 69496;
                        }
                        action("Employees1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Employees';
                            RunObject = page 5201;
                        }
                        action("Projects")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Projects';
                            RunObject = page 89;
                        }
                        action("OSH Framework")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Framework';
                            RunObject = page 69400;
                        }
                        action("OSH Management Plans")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Management Plans';
                            RunObject = page 69447;
                        }
                    }
                    group("Report & Analysis")
                    {
                        action("OSH Framework Summary")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Framework Summary';
                            //  RunObject = report 69450;
                        }
                        action("OSH Mnagement Plan Summary")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Mnagement Plan Summary';
                            //  RunObject = report 69451;
                        }
                    }
                    group("Administration")
                    {
                        action("Hazard Types")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Hazard Types';
                            RunObject = page 69401;
                        }
                        action("Hazard Identification Methods")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Hazard Identification Methods';
                            RunObject = page 69427;
                        }
                        action("Evacuation Events1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Evacuation Events';
                            RunObject = page "Evacuation Events";
                        }
                        action("Workplace Prohibited Items")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Workplace Prohibited Items';
                            RunObject = page "Workplace Prohibited Items";
                        }
                        action("HSE Equipment Categorxies")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'HSE Equipment Categories';
                            //  RunObject = page 69423;
                        }
                        action("Safe Work Permit Types1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safe Work Permit Types';
                            RunObject = page 69413;
                        }
                        action("Safety Workgroups")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safety Workgroups';
                            //  RunObject = page 69419;
                        }
                        action("Safety Rules & Regulations Templates")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safety Rules & Regulations Templates';
                            RunObject = page 69432;
                        }
                        action("Safety Inspection Templates1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safety Inspection Templates';
                            RunObject = page 69439;
                        }
                        action("OSH Legal Instruments")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Legal Instruments';
                            RunObject = page "OSH Legal Instruments";
                        }
                        action("Incident Severity Levels1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Incident Severity Levels';
                            RunObject = page 69490;
                        }
                        action("Incident Party Types1")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Incident Party Levels';
                            RunObject = page 69492;
                        }
                    }
                }
                group("OSH Operations")
                {
                    group("Lists and Tasks1")
                    {
                        caption = 'Lists and Tasks';
                        action("Safety Eequipment Register")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safety Eequipment Register';
                            RunObject = page 69470;
                        }
                        action("OSH Training Register")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Training Register';
                            RunObject = page 69566;
                        }
                        action("OSH Meeting Register")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Meeting Register';
                            RunObject = page 69565;
                        }
                        action("Hazard Insurance Register")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Hazard Insurance Register';
                            RunObject = page 69470;
                        }
                        action("Safe Work Permit Applications")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safe Work Permits';
                            RunObject = page 69482;
                        }
                        action("Safe Work Completion Reports")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Safe Work Permits COM';
                            RunObject = page 69507;
                        }
                        action("Emergency Drill Logs")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Emergency Drill Reports';
                            RunObject = page "Emergency Drill Logs";
                        }
                        action("Risk Incident Reports")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'Risk Incident Reports';
                            RunObject = page 95104;
                        }
                        action("OSH Inspection Vouchers")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Inspection Vouchers';
                            RunObject = page 69532;
                        }
                        action("OSH Status Reports")
                        {
                            ApplicationArea = BasicAdmin;
                            Caption = 'OSH Status Reports';
                            RunObject = page 69439;
                        }

                        group("Reports & Analysis")
                        {
                            action("Safety Equipment List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safety Equipment List';
                                //  RunObject = report 69459;
                            }
                            action("OSH Training List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'OSH Training List';
                                // RunObject = page 69460;
                            }
                            action("OSH Meeting  List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'OSH Meeting  List';
                                // RunObject = page 69461;
                            }
                            action("Hazard Insurance List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Hazard Insurance List';
                                // RunObject = page 69462;
                            }
                            action("Safe Work Permit Application  List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safe Work Permit Application  List';
                                // RunObject = page 69463;
                            }
                            action("Emergency Drill List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Emergency Drill List';
                                // RunObject = page 69464;
                            }
                            action("Risk Incident Log List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Risk Incident Log List';
                                // RunObject = page 69465;
                            }
                            action("OSH Inspection List")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'OSH Inspection List';
                                // RunObject = page 69466;
                            }
                            group("Archieve")
                            {
                                action("Issued Safe Work Permits")
                                {
                                    ApplicationArea = BasicAdmin;
                                    Caption = 'Issued Safe Work Permits';
                                    RunObject = page "Safe Work Permits";
                                }
                                action("Denied Safe Work Permits")
                                {
                                    ApplicationArea = BasicAdmin;
                                    Caption = 'Denied Safe Work Permits';
                                    RunObject = page "Safe Work Permits";
                                }
                                action("Posted Emergency Drills")
                                {
                                    ApplicationArea = BasicAdmin;
                                    Caption = 'Posted Emergency Drills';
                                    RunObject = page "Emergency Drill Logs";
                                }

                                action("Posted Risk Incident Reports")
                                {
                                    ApplicationArea = BasicAdmin;
                                    Caption = 'Posted Risk Incident Reports';
                                    RunObject = page "Risk Incident Logs";
                                }
                                action("Posted OSH Inspection Vouchers")
                                {
                                    ApplicationArea = BasicAdmin;
                                    Caption = 'Posted OSH Inspection Vouchers';
                                    RunObject = page "Inspection Templates";
                                }
                            }


                        }
                        group("Administration1")
                        {
                            Caption = 'Administration';
                            action("Safety Equipment Categories")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safety Equipment Categories';
                                //RunObject = page "HSE Equipment Categorxies";
                            }
                            action("Hazard Types1")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Hazard Types';
                                RunObject = page 69401;
                            }
                            action("Safe Work Permit Types")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safe Work Permit Types';
                                RunObject = page "Safe Work Permit Types";
                            }
                            action("Evacuation Events")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Evacuation Events';
                                RunObject = page "Evacuation Events";
                            }
                            action("Incident Severity Levels")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Incident Severity Levels';
                                RunObject = page "Incident Severity Levels";
                            }
                            action("Safety Inspection Templates")
                            {
                                ApplicationArea = BasicAdmin;
                                Caption = 'Safety Inspection Templates';
                                RunObject = page "Inspection Templates";
                            }

                        }


                    }
                }
            }
            group("Security Incidences")
            {
                action("Incident Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Incident Types';
                    RunObject = Page "Security Incident Types";
                }

                action("Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Security Incidences';
                    RunObject = Page "Security Incidence List";
                }
                action("On-Going Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'On-going Security Incidences';
                    RunObject = Page "Ongoing Security Incidences";
                }
                action("Closed Security Incidence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Closed Security Incidences';
                    RunObject = Page "Closed Security Incidences";
                }
            }
        }
    }
}

profile AdminRoleCenter
{
    ProfileDescription = 'Admin Profile';
    RoleCenter = "Admin Role Center";
    Caption = 'Admin Role Center';
}
