<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Change_Account_Type_to_Key_Account</fullName>
        <field>Type</field>
        <literalValue>Key Account</literalValue>
        <name>Change Account Type to Key Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Promote Key Accounts</fullName>
        <actions>
            <name>Change_Account_Type_to_Key_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.AnnualRevenue</field>
            <operation>greaterThan</operation>
            <value>150000000</value>
        </criteriaItems>
        <description>Promote accounts with high turnover automatically to a Key Account</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
