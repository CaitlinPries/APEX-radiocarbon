## Basic review of each dataset by plotting data
### Guelph data from Katherine Dielman:

```{r}
guelph.gamma$Date <- strptime(guelph.gamma$Date, format="%m/%d/%Y", tz="America/Anchorage")
guelph.gamma$month <- month(guelph.gamma$Date)
guelph.gamma.AugOn <- subset(guelph.gamma, month=="8" | month=="9" | month=="10")
aggregate(Ice_Depth_cm ~ Year, guelph.gamma.AugOn, mean)
g.gamma.AugOn.plot <- ggplot() +
  geom_point(data=guelph.gamma.AugOn, aes(x=as.POSIXct(Date), y=Ice_Depth_cm, color=factor(new_plot2)))
print(g.gamma.AugOn.plot)

```

### USGS data
Need to add new datasets
```{r}
usgs.gamma$date <- strptime(usgs.gamma$date, format="%d-%b-%y", tz="America/Anchorage")
usgs.gamma.AugOn <- subset(usgs.gamma, format(usgs.gamma$date,"%b")=="Aug" | format(usgs.gamma$date,"%b")=="Sept")
aggregate(AL_cm ~ year, usgs.gamma.AugOn, mean)
usgs.gamma.Augon.plot <- ggplot(usgs.gamma.AugOn, aes(x=as.POSIXct(date), y=AL_cm)) +
  geom_point(aes(color=factor(Chamber)))
print(usgs.gamma.Augon.plot)

```

### Crell data

```{r}
#extract date from timestamp
aggregate(Depth ~ transect, crell.gamma, mean)
crell.gamma$date <- as.POSIXct(crell.gamma$date, "%Y-%m-%d", tz="America/Anchorage")
crell.gamma.plot <- ggplot(crell.gamma, aes(x=as.POSIXct(date), y=Depth)) +
  geom_point(aes(color=factor(transect)))
print(crell.gamma.plot)

```