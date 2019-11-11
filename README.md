# Threatfeeds_automation_InsightIDR
Threatfeeds Automation for Rapid7 InsightIDR via API

This repo is to demonstarte and explain how to automate threatfeed integration for Rapid7's InsightIDR (SIEM). InsightIDR natively does not support taxii-feeds(taxii-urls) in their product. That means, there is no feature in the product where the taxii-urls can be added for automatic fetching of indicators into the SIEM. However,there is an API support, but the indicators need to be added through supported formats. There are 3 formats supported by InsightIDR as of now stixx1.1,csv and json. 

The indicators need to be PULLED from the threatfeeds in one of the supported formats by InsightIDR and PUSHED to InsightIDR via respective APIs. For the purpose of this repo, 

- AllienVault's Open Threat Exchange(OTX) is used as a ThreatFeed
- STIX1.1 format is used to pull the indicator-information from OTX
- OTX's user_AlienVault "Collection" is used to pull the Pulses(indicators) from 

In nutshell, 

Pull script pulls the data (via API) from OTX's user_AlientVault "Collection" in the STIXX1.1 format (1 STIXX package/file) and stores these indicators in STIXX1.1 format as multiple files in the destination directory. 

Push script pushes these indicators (via API) to InsightIDR in a specific Threat that we have mentioned in the command. 

Notes:

- [Cabby](https://cabby.readthedocs.io/en/stable/index.html) is used as a taxii-client
- OTX Server acts as a taxii-server, however, it does not support taxii2.0 
- OTX does not allow to fetch the data in STIXX2.0 OT STIXX1.0; only allows STIX1.1
- InsightIDR does not allw to push the STIX1.1 data with multiple STIXX packages in a single file,hence,1 stixx package per file needs to be fetched and pushed to IDR 
- OTX does not support "fetch the indicators from where you left" features hence we need to guesstimate how many pulses will be published in a time-duration from the pull scripts run 
- InsightIDR handles the duplicates well, hence, if duplicate indicators are pushed they will not be duplicated in the Threat

Links: 

[AlientVault OTX](https://otx.alienvault.com/)

[AlienVault API Documentation](https://otx.alienvault.com/api)

[InsightIDR API Documentation](https://help.rapid7.com/insightidr/en-us/api/v1/docs.html#)

Many threatfeeds(like abuse.ch) provide the treatfeeds in a txt format that ca be converted in to CSV and uploaded to IDR in a specific threat. I have updated the repo with the CSV pull and push script. 
